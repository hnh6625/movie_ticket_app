import '../generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ReviewEndpoint extends Endpoint {
  Future<Review> create(
      Session session, {
        required int movieId,
        required int rating,
        required String comment,
      }) async {
    final authInfo = session.authenticated;
    if (authInfo == null) throw Exception('User not authenticated');

    // TODO: kiểm tra user đã có Order status=USED cho phim này chưa
    // (thêm sau khi có model Order)

    final review = Review(
      movieId: movieId,
      userIdentifier: authInfo.userIdentifier,
      rating: rating,
      comment: comment,
      createdAt: DateTime.now(),
    );
    return Review.db.insertRow(session, review);
  }

  Future<List<Review>> getByMovie(Session session, int movieId) async {
    return Review.db.find(session, where: (t) => t.movieId.equals(movieId));
  }
}