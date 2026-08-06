import 'package:serverpod/serverpod.dart' hide Order;
import '../generated/protocol.dart';

class ReviewEndpoint extends Endpoint {
  Future<ReviewCreateResult> create(
      Session session, {
        required int movieId,
        required int rating,
        required String comment,
      }) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      return ReviewCreateResult(success: false, message: 'Chưa đăng nhập');
    }

    // 1. Lấy toàn bộ showtimeId thuộc phim này
    final showtimes = await Showtime.db.find(session, where: (t) => t.movieId.equals(movieId));
    final showtimeIds = showtimes.map((s) => s.id!).toSet();

    // 2. Lấy toàn bộ Order đã USED của user này
    final usedOrders = await Order.db.find(
      session,
      where: (t) => t.userIdentifier.equals(authInfo.userIdentifier) & t.status.equals('USED'),
    );

    // 3. Kiểm tra có Order nào gắn với showtime của phim này không
    final hasWatched = usedOrders.any((order) => showtimeIds.contains(order.showtimeId));
    if (!hasWatched) {
      return ReviewCreateResult(success: false, message: 'Bạn cần xem phim này trước khi đánh giá');
    }

    // 4. Kiểm tra chưa review trước đó (tránh lỗi unique constraint khó hiểu)
    final existing = await Review.db.findFirstRow(
      session,
      where: (t) => t.movieId.equals(movieId) & t.userIdentifier.equals(authInfo.userIdentifier),
    );
    if (existing != null) {
      return ReviewCreateResult(success: false, message: 'Bạn đã đánh giá phim này rồi');
    }

    final review = await Review.db.insertRow(
      session,
      Review(
        movieId: movieId,
        userIdentifier: authInfo.userIdentifier,
        rating: rating,
        comment: comment,
        createdAt: DateTime.now(),
      ),
    );

    return ReviewCreateResult(success: true, reviewId: review.id);
  }

  Future<List<Review>> getByMovie(Session session, int movieId) async {
    return Review.db.find(session, where: (t) => t.movieId.equals(movieId));
  }
}