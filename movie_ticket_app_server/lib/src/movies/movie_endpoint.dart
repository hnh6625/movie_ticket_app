import '../generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

/// Endpoint for managing movies. Accessed through `client.movie` on the client side.
class MovieEndpoint extends Endpoint {
  /// Returns a list of movies, optionally filtered by [status].
  Future<List<Movie>> getAll(Session session, {String? status}) async {
    if (status != null) {
      return Movie.db.find(
        session,
        where: (t) => t.status.equals(status),
      );
    }
    return Movie.db.find(session);
  }

  /// Returns a single movie by its [id].
  Future<Movie?> getById(Session session, int id) async {
    return Movie.db.findById(session, id);
  }
}