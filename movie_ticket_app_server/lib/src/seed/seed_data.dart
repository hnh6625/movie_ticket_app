import 'package:serverpod/serverpod.dart' hide Order;
import '../generated/protocol.dart';

Future<void> seedMovies(Session session) async {
  final existing = await Movie.db.find(session);
  if (existing.isNotEmpty) return;

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

Future<void> seedCinemasAndSeats(Session session) async {
  final existing = await Cinema.db.find(session);
  if (existing.isNotEmpty) return;

  final cinemaData = [
    {'name': 'CGV Vincom', 'address': '72 Lê Thánh Tôn, Q1, TP.HCM', 'lat': 10.7769, 'lng': 106.7009},
    {'name': 'Lotte Cinema Gò Vấp', 'address': '242 Nguyễn Văn Lượng, Gò Vấp, TP.HCM', 'lat': 10.8382, 'lng': 106.6626},
    {'name': 'Galaxy Nguyễn Du', 'address': '116 Nguyễn Du, Q1, TP.HCM', 'lat': 10.7725, 'lng': 106.6934},
  ];

  for (final data in cinemaData) {
    final cinema = await Cinema.db.insertRow(session, Cinema(
      name: data['name'] as String,
      address: data['address'] as String,
      latitude: data['lat'] as double,
      longitude: data['lng'] as double,
    ));

    // Mỗi rạp tạo 1 phòng chiếu
    final room = await Room.db.insertRow(session, Room(
      cinemaId: cinema.id!,
      name: 'Phòng 1',
      roomType: 'STANDARD',
    ));

    // Mỗi phòng tạo lưới ghế 5 hàng x 8 cột (40 ghế) — đủ nhỏ để dễ test trên UI
    for (var row = 0; row < 5; row++) {
      final rowLabel = String.fromCharCode(65 + row); // A, B, C, D, E
      for (var col = 1; col <= 8; col++) {
        // Hàng cuối (E) làm ghế đôi, hàng D làm VIP, còn lại Thường
        final seatType = rowLabel == 'E' ? 'COUPLE' : (rowLabel == 'D' ? 'VIP' : 'STANDARD');
        await Seat.db.insertRow(session, Seat(
          roomId: room.id!,
          rowLabel: rowLabel,
          seatNumber: col,
          seatType: seatType,
        ));
      }
    }
  }
}

Future<void> seedShowtimes(Session session) async {
  final existing = await Showtime.db.find(session);
  if (existing.isNotEmpty) return;

  final movies = await Movie.db.find(session);
  final rooms = await Room.db.find(session);

  for (final movie in movies) {
    for (final room in rooms) {
      // Mỗi phim x mỗi phòng tạo 2 suất chiếu: chiều và tối
      final showtimeAfternoon = await Showtime.db.insertRow(session, Showtime(
        movieId: movie.id!,
        roomId: room.id!,
        startTime: DateTime.now().add(const Duration(days: 1, hours: 14)),
        basePrice: 75000,
      ));
      final showtimeEvening = await Showtime.db.insertRow(session, Showtime(
        movieId: movie.id!,
        roomId: room.id!,
        startTime: DateTime.now().add(const Duration(days: 1, hours: 19)),
        basePrice: 95000, // giờ vàng, giá cao hơn
      ));

      // Tạo ShowtimeSeat cho từng ghế thuộc phòng đó, cho cả 2 suất
      final seats = await Seat.db.find(session, where: (t) => t.roomId.equals(room.id!));
      for (final showtime in [showtimeAfternoon, showtimeEvening]) {
        for (final seat in seats) {
          await ShowtimeSeat.db.insertRow(session, ShowtimeSeat(
            showtimeId: showtime.id!,
            seatId: seat.id!,
            status: 'AVAILABLE',
            heldByUserId: null,
            holdExpiredAt: null,
          ));
        }
      }
    }
  }
}

Future<void> seedConcessions(Session session) async {
  final existing = await Concession.db.find(session);
  if (existing.isNotEmpty) return;

  final data = [
    {'name': 'Bắp rang bơ (L)', 'price': 55000.0},
    {'name': 'Coca-Cola (L)', 'price': 35000.0},
    {'name': 'Combo bắp + nước', 'price': 79000.0},
    {'name': 'Snack Poca', 'price': 25000.0},
  ];

  for (final item in data) {
    await Concession.db.insertRow(session, Concession(
      name: item['name'] as String,
      description: '',
      imageUrl: 'https://via.placeholder.com/150',
      price: item['price'] as double,
    ));
  }
}