import 'dart:async';
import 'package:get/get.dart';
import 'package:movie_ticket_app_client/movie_ticket_app_client.dart';

import '../../core/base_controller.dart';
import '../../data/services/api_client.dart';
import 'seat_display_model.dart';

const _pollingInterval = Duration(seconds: 6);
const _tickInterval = Duration(seconds: 1);
const holdDurationMinutes = 5;

class SeatSelectionController extends BaseController {
  late final int showtimeId;
  int? _roomId;

  final seats = <SeatDisplayModel>[].obs;
  final mySelectedShowtimeSeatIds = <int>[].obs;
  final remainingSeconds = RxnInt();

  Timer? _pollingTimer;
  Timer? _countdownTimer;
  DateTime? _myHoldExpiredAt;

  @override
  void onInit() {
    super.onInit();
    showtimeId = Get.arguments['showtimeId'] as int;
    _loadInitial();
  }

  @override
  void onClose() {
    _pollingTimer?.cancel();
    _countdownTimer?.cancel();
    // Rời màn hình mà chưa thanh toán -> tự động nhả hết ghế đang giữ
    if (mySelectedShowtimeSeatIds.isNotEmpty) {
      client.showtime.releaseSeats(showtimeSeatIds: mySelectedShowtimeSeatIds.toList());
    }
    super.onClose();
  }

  Future<void> _loadInitial() async {
    await runSafely(() async {
      final showtime = await client.showtime.getById(showtimeId);
      _roomId = showtime?.roomId;
      await _fetchSeatsAndMerge();
      _startPolling();
    });
  }

  Future<void> _fetchSeatsAndMerge() async {
    final showtimeSeats = await client.showtime.getSeats(showtimeId);
    if (_roomId == null) return;

    final room = await client.cinema.getRoomWithSeats(_roomId!);
    final roomSeats = room?.seats ?? <Seat>[];
    final seatById = {for (final s in roomSeats) s.id: s};

    final merged = showtimeSeats
        .where((ss) => seatById.containsKey(ss.seatId))
        .map((ss) => SeatDisplayModel(showtimeSeat: ss, seat: seatById[ss.seatId]!))
        .toList();

    merged.sort((a, b) {
      final rowCompare = a.seat.rowLabel.compareTo(b.seat.rowLabel);
      if (rowCompare != 0) return rowCompare;
      return a.seat.seatNumber.compareTo(b.seat.seatNumber);
    });

    seats.assignAll(merged);
  }

  void _startPolling() {
    _pollingTimer = Timer.periodic(_pollingInterval, (_) async {
      // Không hiện loading toàn màn khi polling ngầm, chỉ refetch lặng lẽ
      try {
        await _fetchSeatsAndMerge();
      } catch (_) {
        // Bỏ qua lỗi polling ngầm, không làm phiền người dùng
      }
    });
  }

  void _startCountdown(DateTime expiredAt) {
    _myHoldExpiredAt = expiredAt;
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(_tickInterval, (_) {
      final diff = _myHoldExpiredAt!.difference(DateTime.now()).inSeconds;
      if (diff <= 0) {
        remainingSeconds.value = 0;
        _onHoldExpired();
      } else {
        remainingSeconds.value = diff;
      }
    });
  }

  Future<void> _onHoldExpired() async {
    _countdownTimer?.cancel();
    mySelectedShowtimeSeatIds.clear();
    remainingSeconds.value = null;
    errorMessage.value = 'Đã hết thời gian giữ ghế, vui lòng chọn lại.';
    await _fetchSeatsAndMerge();
  }

  /// Xử lý khi người dùng bấm vào 1 ghế.
  Future<void> onSeatTap(SeatDisplayModel seatModel) async {
    final ss = seatModel.showtimeSeat;

    if (ss.status == 'BOOKED') return; // ghế đã đặt, không làm gì
    if (ss.status == 'HELD' && !seatModel.isHeldByMe) return; // người khác đang giữ

    if (ss.status == 'AVAILABLE') {
      await _holdSeat(ss.id!);
    } else if (seatModel.isHeldByMe) {
      await _releaseSeat(ss.id!);
    }
  }

  Future<void> _holdSeat(int showtimeSeatId) async {
    await runSafely(() async {
      final result = await client.showtime.holdSeats(
        showtimeId: showtimeId,
        showtimeSeatIds: [...mySelectedShowtimeSeatIds, showtimeSeatId],
      );

      if (!result.success) {
        errorMessage.value = result.message ?? 'Không thể giữ ghế này';
        await _fetchSeatsAndMerge(); // refresh ngay để thấy trạng thái mới nhất
        return;
      }

      mySelectedShowtimeSeatIds.add(showtimeSeatId);
      _startCountdown(result.expiredAt!);
      await _fetchSeatsAndMerge();
    });
  }

  Future<void> _releaseSeat(int showtimeSeatId) async {
    await runSafely(() async {
      await client.showtime.releaseSeats(showtimeSeatIds: [showtimeSeatId]);
      mySelectedShowtimeSeatIds.remove(showtimeSeatId);
      if (mySelectedShowtimeSeatIds.isEmpty) {
        _countdownTimer?.cancel();
        remainingSeconds.value = null;
      }
      await _fetchSeatsAndMerge();
    });
  }

  double get totalPrice {
    double total = 0;
    for (final s in seats) {
      if (mySelectedShowtimeSeatIds.contains(s.showtimeSeat.id)) {
        // TODO: nhân với basePrice thật của showtime nếu cần hiển thị chính xác,
        // hiện tạm hiển thị theo hệ số loại ghế * 75000 làm ví dụ
        final multiplier = s.seat.seatType == 'VIP' ? 1.5 : (s.seat.seatType == 'COUPLE' ? 2.0 : 1.0);
        total += 75000 * multiplier;
      }
    }
    return total;
  }

  void goToConcessions() {
    if (mySelectedShowtimeSeatIds.isEmpty) {
      errorMessage.value = 'Vui lòng chọn ít nhất 1 ghế';
      return;
    }
    Get.toNamed('/concessions', arguments: {
      'showtimeId': showtimeId,
      'showtimeSeatIds': mySelectedShowtimeSeatIds.toList(),
    });
  }
}