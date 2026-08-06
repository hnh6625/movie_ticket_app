import 'package:serverpod/serverpod.dart' hide Order;
import '../generated/protocol.dart';
import 'dart:async' show unawaited;
import 'email_service.dart';

/// Hệ số nhân giá theo loại ghế.
double _seatTypeMultiplier(String seatType) {
  switch (seatType) {
    case 'VIP':
      return 1.5;
    case 'COUPLE':
      return 2.0;
    default:
      return 1.0;
  }
}

class OrderEndpoint extends Endpoint {
  Future<Map<String, dynamic>> create(
      Session session, {
        required int showtimeId,
        required List<int> showtimeSeatIds,
        required Map<int, int> concessionQuantities, // concessionId -> quantity
        required String paymentMethod,
      }) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      return {'success': false, 'message': 'Chưa đăng nhập'};
    }

    final showtime = await Showtime.db.findById(session, showtimeId);
    if (showtime == null) {
      return {'success': false, 'message': 'Suất chiếu không tồn tại'};
    }

    return await session.db.transaction((transaction) async {
      // 1. Kiểm tra toàn bộ ghế vẫn đang HELD bởi đúng user và chưa hết hạn
      double seatsTotal = 0;
      final validatedSeats = <ShowtimeSeat>[];

      for (final id in showtimeSeatIds) {
        final showtimeSeat = await ShowtimeSeat.db.findById(session, id, transaction: transaction);
        if (showtimeSeat == null) {
          return {'success': false, 'message': 'Ghế không tồn tại'};
        }
        if (showtimeSeat.status != 'HELD' ||
            showtimeSeat.heldByUserId != authInfo.userIdentifier) {
          return {'success': false, 'message': 'Một số ghế không còn được giữ bởi bạn, vui lòng chọn lại'};
        }
        if (showtimeSeat.holdExpiredAt != null &&
            showtimeSeat.holdExpiredAt!.isBefore(DateTime.now())) {
          return {'success': false, 'message': 'Thời gian giữ ghế đã hết hạn, vui lòng chọn lại'};
        }

        final seat = await Seat.db.findById(session, showtimeSeat.seatId, transaction: transaction);
        final price = showtime.basePrice * _seatTypeMultiplier(seat!.seatType);
        seatsTotal += price;
        validatedSeats.add(showtimeSeat);
      }

      // 2. Tính tiền combo
      double concessionsTotal = 0;
      final concessionEntries = <MapEntry<Concession, int>>[];
      for (final entry in concessionQuantities.entries) {
        final concession = await Concession.db.findById(session, entry.key, transaction: transaction);
        if (concession == null) continue;
        concessionsTotal += concession.price * entry.value;
        concessionEntries.add(MapEntry(concession, entry.value));
      }

      final totalPrice = seatsTotal + concessionsTotal;

      // 3. Tạo Order
      final order = await Order.db.insertRow(
        session,
        Order(
          userIdentifier: authInfo.userIdentifier,
          showtimeId: showtimeId,
          totalPrice: totalPrice,
          status: 'PAID', // mô phỏng thanh toán luôn thành công sau bước xác nhận PIN ở FE
          paymentMethod: paymentMethod,
          qrCodeData: null,
          createdAt: DateTime.now(),
        ),
        transaction: transaction,
      );

      // Sinh QR data đơn giản từ orderId sau khi đã có id
      final updatedOrder = order.copyWith(qrCodeData: 'TICKET-${order.id}');
      await Order.db.updateRow(session, updatedOrder, transaction: transaction);

      // 4. Tạo OrderSeat + chuyển ShowtimeSeat sang BOOKED + hủy Future Call
      for (final showtimeSeat in validatedSeats) {
        final seat = await Seat.db.findById(session, showtimeSeat.seatId, transaction: transaction);
        final price = showtime.basePrice * _seatTypeMultiplier(seat!.seatType);

        await OrderSeat.db.insertRow(
          session,
          OrderSeat(orderId: order.id!, showtimeSeatId: showtimeSeat.id!, price: price),
          transaction: transaction,
        );

        final bookedSeat = showtimeSeat.copyWith(
          status: 'BOOKED',
          heldByUserId: null,
          holdExpiredAt: null,
        );
        await ShowtimeSeat.db.updateRow(session, bookedSeat, transaction: transaction);
        await session.serverpod.cancelFutureCall('seat_${showtimeSeat.id}');
      }

      // 5. Tạo OrderConcession
      for (final entry in concessionEntries) {
        await OrderConcession.db.insertRow(
          session,
          OrderConcession(
            orderId: order.id!,
            concessionId: entry.key.id!,
            quantity: entry.value,
            price: entry.key.price * entry.value,
          ),
          transaction: transaction,
        );
      }

      // Lên lịch tự động chuyển Order sang USED đúng giờ chiếu
      // (cho nghiệp vụ đánh giá phim sau khi xem)
      await session.serverpod.futureCallAtTime(
        'markOrderUsed',
        OrderUsedPayload(orderId: order.id!),
        showtime.startTime,
        identifier: 'order_${order.id}',
      );

      // Gửi email vé (không chặn response nếu gửi lỗi)
      final profile = await UserProfile.db.findFirstRow(
        session,
        where: (t) => t.userIdentifier.equals(authInfo.userIdentifier),
        transaction: transaction,
      );
      if (profile != null) {
        // Không await trong transaction để tránh giữ transaction quá lâu chờ gửi mail
        unawaited(sendTicketEmail(session, updatedOrder, profile.email));
      }

      return {
        'success': true,
        'orderId': order.id,
        'totalPrice': totalPrice,
        'qrCodeData': updatedOrder.qrCodeData,
      };
    });
  }

  Future<Order?> getById(Session session, int id) async {
    return Order.db.findById(session, id);
  }

  Future<List<Order>> getMyOrders(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) return [];

    return Order.db.find(
      session,
      where: (t) => t.userIdentifier.equals(authInfo.userIdentifier),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }
}