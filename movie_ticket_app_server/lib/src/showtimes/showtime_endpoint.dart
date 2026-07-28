import '../generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ShowtimeEndpoint extends Endpoint {
  Future<List<Showtime>> getByCinemaAndMovie(
      Session session, {
        required int movieId,
        required DateTime date,
      }) async {
    return Showtime.db.find(
      session,
      where: (t) => t.movieId.equals(movieId),
    );
  }

  Future<List<ShowtimeSeat>> getSeats(Session session, int showtimeId) async {
    return ShowtimeSeat.db.find(
      session,
      where: (t) => t.showtimeId.equals(showtimeId),
    );
  }

  Future<bool> holdSeats(
      Session session, {
        required int showtimeId,
        required List<int> seatIds,
        required int userId,
      }) async {
    // TODO: dùng transaction + lock để chống trùng ghế, mình sẽ hướng dẫn
    // chi tiết ở bước làm Future Call tự động nhả ghế (bước tiếp theo)
    return true;
  }
}