import 'package:serverpod/serverpod.dart' hide Order;
import '../generated/protocol.dart';

Future<void> seedMovies(Session session) async {
  final existing = await Movie.db.find(session);
  if (existing.isNotEmpty) return;

  final movieData = [
    {
      'title': 'Avengers: Doomsday',
      'description': 'Phim siêu anh hùng bom tấn.',
      'genre': 'Hành động',
      'duration': 150,
      'release': DateTime(2026, 5, 1),
      'status': 'SHOWING',
      'rating': 4.5,
      'color': '1a1a2e',
      'trailer': '4jVs_LB2BHg',
    },
    {
      'title': 'Zootopia 2',
      'description': 'Phim hoạt hình gia đình.',
      'genre': 'Hoạt hình',
      'duration': 108,
      'release': DateTime(2026, 11, 1),
      'status': 'SHOWING',
      'rating': 4.2,
      'color': '2e7d32',
      'trailer': '50RhV9T5yNw',
    },
    {
      'title': 'Kinh Hoàng Đêm Trăng',
      'description': 'Phim kinh dị gay cấn.',
      'genre': 'Kinh dị',
      'duration': 98,
      'release': DateTime(2026, 3, 15),
      'status': 'SHOWING',
      'rating': 3.9,
      'color': '4a148c',
      'trailer': 'e1uMDWjOfG4',
    },
    {
      'title': 'Nhật Ký Tình Yêu',
      'description': 'Câu chuyện tình lãng mạn cảm động.',
      'genre': 'Tình cảm',
      'duration': 115,
      'release': DateTime(2026, 2, 10),
      'status': 'SHOWING',
      'rating': 4.0,
      'color': 'ad1457',
      'trailer': 'N-_4hNJisrk',
    },
    {
      'title': 'Cười Xuyên Việt',
      'description': 'Phim hài giải trí nhẹ nhàng.',
      'genre': 'Hài',
      'duration': 100,
      'release': DateTime(2026, 4, 20),
      'status': 'SHOWING',
      'rating': 4.1,
      'color': 'f57f17',
      'trailer': 'LDGuRd4ScjI',
    },
    {
      'title': 'Truy Tìm Kho Báu',
      'description': 'Hành trình phiêu lưu mạo hiểm.',
      'genre': 'Phiêu lưu',
      'duration': 130,
      'release': DateTime(2026, 9, 5),
      'status': 'COMING_SOON',
      'rating': 0.0,
      'color': '6d4c41',
      'trailer': 'UoDgatx8dPw',
    },
    {
      'title': 'Hành Tinh Đỏ',
      'description': 'Khoa học viễn tưởng ngoài không gian.',
      'genre': 'Viễn tưởng',
      'duration': 140,
      'release': DateTime(2026, 10, 12),
      'status': 'COMING_SOON',
      'rating': 0.0,
      'color': 'b71c1c',
      'trailer': 'AEm6Z7pv6qg',
    },
    {
      'title': 'Vụ Án Mất Tích',
      'description': 'Phim trinh thám hình sự gay cấn.',
      'genre': 'Trinh thám',
      'duration': 120,
      'release': DateTime(2026, 8, 1),
      'status': 'SHOWING',
      'rating': 4.3,
      'color': '263238',
      'trailer': 'HcDpH7akUd0',
    },
  ];

  for (final m in movieData) {
    final title = m['title'] as String;
    await Movie.db.insertRow(session, Movie(
      title: title,
      description: m['description'] as String,
      posterUrl:
      'https://placehold.co/300x450/${m['color']}/ffffff?text=${Uri.encodeComponent(title)}',
      trailerYoutubeId: m['trailer'] as String,
      genre: m['genre'] as String,
      durationMinutes: m['duration'] as int,
      releaseDate: m['release'] as DateTime,
      status: m['status'] as String,
      avgRating: m['rating'] as double,
      createdAt: DateTime.now(),
    ));
  }
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

    final room = await Room.db.insertRow(session, Room(
      cinemaId: cinema.id!,
      name: 'Phòng 1',
      roomType: 'STANDARD',
    ));

    for (var row = 0; row < 5; row++) {
      final rowLabel = String.fromCharCode(65 + row);
      for (var col = 1; col <= 8; col++) {
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

  final movies = await Movie.db.find(session, where: (t) => t.status.equals('SHOWING'));
  final rooms = await Room.db.find(session);

  Future<void> createShowtimeWithSeats({
    required int movieId,
    required int roomId,
    required DateTime startTime,
    required double basePrice,
  }) async {
    final showtime = await Showtime.db.insertRow(session, Showtime(
      movieId: movieId,
      roomId: roomId,
      startTime: startTime,
      basePrice: basePrice,
    ));

    final seats = await Seat.db.find(session, where: (t) => t.roomId.equals(roomId));
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

  final timeSlots = [
    {'hour': 10, 'price': 65000.0},
    {'hour': 14, 'price': 75000.0},
    {'hour': 19, 'price': 95000.0}, // giờ vàng
  ];

  for (final movie in movies) {
    for (final room in rooms) {
      for (var dayOffset = 1; dayOffset <= 3; dayOffset++) {
        final day = DateTime.now().add(Duration(days: dayOffset));
        for (final slot in timeSlots) {
          await createShowtimeWithSeats(
            movieId: movie.id!,
            roomId: room.id!,
            startTime: DateTime(day.year, day.month, day.day, slot['hour'] as int),
            basePrice: slot['price'] as double,
          );
        }
      }
    }
  }

  // Suất chiếu ĐẶC BIỆT để test nhanh: bắt đầu chỉ 3 phút nữa (phim đầu tiên, rạp đầu tiên).
  // Đặt vé suất này xong, chỉ cần đợi ~3 phút là Order tự chuyển PAID -> USED,
  // giúp test ngay chức năng "Đánh giá phim" mà không phải đợi vài ngày như suất thường.
  if (movies.isNotEmpty && rooms.isNotEmpty) {
    await createShowtimeWithSeats(
      movieId: movies.first.id!,
      roomId: rooms.first.id!,
      startTime: DateTime.now().add(const Duration(minutes: 3)),
      basePrice: 75000,
    );
  }
}

Future<void> seedConcessions(Session session) async {
  final existing = await Concession.db.find(session);
  if (existing.isNotEmpty) return;

  final data = [
    {'name': 'Bắp rang bơ (L)', 'price': 55000.0},
    {'name': 'Bắp rang phô mai (L)', 'price': 59000.0},
    {'name': 'Coca-Cola (L)', 'price': 35000.0},
    {'name': 'Pepsi (L)', 'price': 35000.0},
    {'name': 'Combo bắp + nước', 'price': 79000.0},
    {'name': 'Snack Poca', 'price': 25000.0},
    {'name': 'Kẹo dẻo', 'price': 20000.0},
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