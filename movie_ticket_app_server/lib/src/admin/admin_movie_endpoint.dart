import 'package:serverpod/serverpod.dart' hide Order;
import '../generated/protocol.dart';

class AdminMovieEndpoint extends Endpoint {
  Future<bool> _isAdmin(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) return false;
    final profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userIdentifier.equals(authInfo.userIdentifier),
    );
    return profile?.role == 'ADMIN';
  }

  Future<Movie?> create(Session session, Movie movie) async {
    if (!await _isAdmin(session)) return null;
    return Movie.db.insertRow(session, movie);
  }

  Future<Movie?> update(Session session, Movie movie) async {
    if (!await _isAdmin(session)) return null;
    return Movie.db.updateRow(session, movie);
  }

  Future<bool> delete(Session session, int id) async {
    if (!await _isAdmin(session)) return false;
    final movie = await Movie.db.findById(session, id);
    if (movie == null) return false;
    await Movie.db.deleteRow(session, movie);
    return true;
  }
}