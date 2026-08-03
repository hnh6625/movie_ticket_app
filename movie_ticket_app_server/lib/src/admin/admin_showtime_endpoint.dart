import 'package:serverpod/serverpod.dart' hide Order;
import '../generated/protocol.dart';

class AdminShowtimeEndpoint extends Endpoint {
  Future<bool> _isAdmin(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) return false;
    final profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userIdentifier.equals(authInfo.userIdentifier),
    );
    return profile?.role == 'ADMIN';
  }

  Future<Showtime?> create(
      Session session, {
        required int movieId,
        required int roomId,
        required DateTime startTime,
        required double basePrice,
      }) async {
    if (!await _isAdmin(session)) return null;

    final showtime = await Showtime.db.insertRow(
      session,
      Showtime(movieId: movieId, roomId: roomId, startTime: startTime, basePrice: basePrice),
    );

    // Tự động tạo ShowtimeSeat cho toàn bộ ghế thuộc phòng này
    final seats = await Seat.db.find(session, where: (t) => t.roomId.equals(roomId));
    for (final seat in seats) {
      await ShowtimeSeat.db.insertRow(
        session,
        ShowtimeSeat(
          showtimeId: showtime.id!,
          seatId: seat.id!,
          status: 'AVAILABLE',
          heldByUserId: null,
          holdExpiredAt: null,
        ),
      );
    }

    return showtime;
  }

  Future<bool> delete(Session session, int id) async {
    if (!await _isAdmin(session)) return false;
    final showtime = await Showtime.db.findById(session, id);
    if (showtime == null) return false;

    // Xóa hết ShowtimeSeat liên quan trước (tránh lỗi ràng buộc khóa ngoại)
    final showtimeSeats = await ShowtimeSeat.db.find(session, where: (t) => t.showtimeId.equals(id));
    for (final s in showtimeSeats) {
      await ShowtimeSeat.db.deleteRow(session, s);
    }

    await Showtime.db.deleteRow(session, showtime);
    return true;
  }
}