import 'package:serverpod/serverpod.dart' hide Order;
import '../generated/protocol.dart';

class AdminCinemaEndpoint extends Endpoint {
  Future<bool> _isAdmin(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) return false;
    final profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userIdentifier.equals(authInfo.userIdentifier),
    );
    return profile?.role == 'ADMIN';
  }

  // Cinema
  Future<Cinema?> createCinema(Session session, Cinema cinema) async {
    if (!await _isAdmin(session)) return null;
    return Cinema.db.insertRow(session, cinema);
  }

  Future<Cinema?> updateCinema(Session session, Cinema cinema) async {
    if (!await _isAdmin(session)) return null;
    return Cinema.db.updateRow(session, cinema);
  }

  Future<bool> deleteCinema(Session session, int id) async {
    if (!await _isAdmin(session)) return false;
    final cinema = await Cinema.db.findById(session, id);
    if (cinema == null) return false;
    await Cinema.db.deleteRow(session, cinema);
    return true;
  }

  // Room (thuộc 1 cinema)
  Future<Room?> createRoom(Session session, Room room) async {
    if (!await _isAdmin(session)) return null;
    return Room.db.insertRow(session, room);
  }

  Future<bool> deleteRoom(Session session, int id) async {
    if (!await _isAdmin(session)) return false;
    final room = await Room.db.findById(session, id);
    if (room == null) return false;
    await Room.db.deleteRow(session, room);
    return true;
  }
}