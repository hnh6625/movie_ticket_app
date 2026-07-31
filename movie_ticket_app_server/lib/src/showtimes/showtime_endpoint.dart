import '../generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

const maxSeatsPerHold = 8;
const holdDurationMinutes = 5;

class ShowtimeEndpoint extends Endpoint {
  Future<List<Showtime>> getByCinemaAndMovie(
      Session session, {
        required int movieId,
        required DateTime date,
      }) async {
    return Showtime.db.find(session, where: (t) => t.movieId.equals(movieId));
  }

  Future<List<ShowtimeSeat>> getSeats(Session session, int showtimeId) async {
    // Lazy check: nhả các ghế đã hết hạn trước khi trả về, phòng future call lỗi
    final seats = await ShowtimeSeat.db.find(
      session,
      where: (t) => t.showtimeId.equals(showtimeId),
    );

    final now = DateTime.now();
    for (final seat in seats) {
      if (seat.status == 'HELD' &&
          seat.holdExpiredAt != null &&
          seat.holdExpiredAt!.isBefore(now)) {
        final updated = seat.copyWith(
          status: 'AVAILABLE',
          heldByUserId: null,
          holdExpiredAt: null,
        );
        await ShowtimeSeat.db.updateRow(session, updated);
      }
    }

    return ShowtimeSeat.db.find(session, where: (t) => t.showtimeId.equals(showtimeId));
  }

  Future<Map<String, dynamic>> holdSeats(
      Session session, {
        required int showtimeId,
        required List<int> showtimeSeatIds,
      }) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      return {'success': false, 'message': 'Chưa đăng nhập'};
    }

    if (showtimeSeatIds.length > maxSeatsPerHold) {
      return {'success': false, 'message': 'Chỉ được chọn tối đa $maxSeatsPerHold ghế'};
    }

    final newExpiry = DateTime.now().add(const Duration(minutes: holdDurationMinutes));

    return await session.db.transaction((transaction) async {
      for (final id in showtimeSeatIds) {
        final seat = await ShowtimeSeat.db.findById(session, id, transaction: transaction);
        if (seat == null) {
          return {'success': false, 'message': 'Ghế không tồn tại'};
        }
        if (seat.status == 'BOOKED') {
          return {'success': false, 'message': 'Ghế đã được đặt'};
        }
        if (seat.status == 'HELD' && seat.heldByUserId != authInfo.userIdentifier) {
          return {'success': false, 'message': 'Ghế đang được người khác giữ'};
        }
      }

      // Toàn bộ ghế hợp lệ, tiến hành hold
      for (final id in showtimeSeatIds) {
        final seat = await ShowtimeSeat.db.findById(session, id, transaction: transaction);
        final updated = seat!.copyWith(
          status: 'HELD',
          heldByUserId: authInfo.userIdentifier,
          holdExpiredAt: newExpiry,
        );
        await ShowtimeSeat.db.updateRow(session, updated, transaction: transaction);

        // Schedule Future Call tự động nhả ghế này sau 5 phút
        await session.serverpod.futureCallWithDelay(
          'releaseSeat',
          ShowtimeSeatReleasePayload(showtimeSeatId: id),
          const Duration(minutes: holdDurationMinutes),
          identifier: 'seat_$id',
        );
      }

      return {'success': true, 'expiredAt': newExpiry.toIso8601String()};
    });
  }

  Future<bool> releaseSeats(
      Session session, {
        required List<int> showtimeSeatIds,
      }) async {
    final authInfo = session.authenticated;
    if (authInfo == null) return false;

    for (final id in showtimeSeatIds) {
      final seat = await ShowtimeSeat.db.findById(session, id);
      if (seat != null && seat.heldByUserId == authInfo.userIdentifier) {
        final updated = seat.copyWith(
          status: 'AVAILABLE',
          heldByUserId: null,
          holdExpiredAt: null,
        );
        await ShowtimeSeat.db.updateRow(session, updated);
        await session.serverpod.cancelFutureCall('seat_$id');
      }
    }
    return true;
  }
}