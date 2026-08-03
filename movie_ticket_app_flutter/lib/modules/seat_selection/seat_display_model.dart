import 'package:movie_ticket_app_client/movie_ticket_app_client.dart';

/// Gộp ShowtimeSeat (trạng thái) với Seat (vị trí, loại ghế) để tiện hiển thị UI.
class SeatDisplayModel {
  final ShowtimeSeat showtimeSeat;
  final Seat seat;

  SeatDisplayModel({required this.showtimeSeat, required this.seat});

  String get label => '${seat.rowLabel}${seat.seatNumber}';
  String get status => showtimeSeat.status;
  bool get isHeldByMe => showtimeSeat.heldByUserId != null;
}