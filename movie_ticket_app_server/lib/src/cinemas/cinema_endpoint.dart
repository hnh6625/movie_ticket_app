import '../generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CinemaEndpoint extends Endpoint {
  Future<List<Cinema>> getAll(Session session) async {
    return Cinema.db.find(
      session,
      include: Cinema.include(rooms: Room.includeList()),
    );
  }

  Future<Room?> getRoomWithSeats(Session session, int roomId) async {
    return Room.db.findById(
      session,
      roomId,
      include: Room.include(seats: Seat.includeList()),
    );
  }
}