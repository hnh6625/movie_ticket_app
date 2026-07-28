import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

Future<void> seedMovies(Session session) async {
  final existing = await Movie.db.find(session);
  if (existing.isNotEmpty) return; // đã có dữ liệu rồi, không seed lại

  await Movie.db.insertRow(session, Movie(
    title: 'Avengers: Doomsday',
    description: 'Phim siêu anh hùng bom tấn.',
    posterUrl: 'https://via.placeholder.com/300x450',
    trailerYoutubeId: 'dQw4w9WgXcQ',
    genre: 'Hành động',
    durationMinutes: 150,
    releaseDate: DateTime(2026, 5, 1),
    status: 'SHOWING',
    avgRating: 4.5,
    createdAt: DateTime.now(),
  ));

  await Movie.db.insertRow(session, Movie(
    title: 'Zootopia 2',
    description: 'Phim hoạt hình gia đình.',
    posterUrl: 'https://via.placeholder.com/300x450',
    trailerYoutubeId: 'dQw4w9WgXcQ',
    genre: 'Hoạt hình',
    durationMinutes: 108,
    releaseDate: DateTime(2026, 11, 1),
    status: 'SHOWING',
    avgRating: 4.2,
    createdAt: DateTime.now(),
  ));
}