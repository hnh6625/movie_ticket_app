/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../showtimes/showtime_seat.dart' as _i2;
import 'package:movie_ticket_app_client/src/protocol/protocol.dart' as _i3;

abstract class Showtime implements _i1.SerializableModel {
  Showtime._({
    this.id,
    required this.movieId,
    required this.roomId,
    required this.startTime,
    required this.basePrice,
    this.showtimeSeats,
  });

  factory Showtime({
    int? id,
    required int movieId,
    required int roomId,
    required DateTime startTime,
    required double basePrice,
    List<_i2.ShowtimeSeat>? showtimeSeats,
  }) = _ShowtimeImpl;

  factory Showtime.fromJson(Map<String, dynamic> jsonSerialization) {
    return Showtime(
      id: jsonSerialization['id'] as int?,
      movieId: jsonSerialization['movieId'] as int,
      roomId: jsonSerialization['roomId'] as int,
      startTime: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['startTime'],
      ),
      basePrice: (jsonSerialization['basePrice'] as num).toDouble(),
      showtimeSeats: jsonSerialization['showtimeSeats'] == null
          ? null
          : _i3.Protocol().deserialize<List<_i2.ShowtimeSeat>>(
              jsonSerialization['showtimeSeats'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int movieId;

  int roomId;

  DateTime startTime;

  double basePrice;

  List<_i2.ShowtimeSeat>? showtimeSeats;

  /// Returns a shallow copy of this [Showtime]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Showtime copyWith({
    int? id,
    int? movieId,
    int? roomId,
    DateTime? startTime,
    double? basePrice,
    List<_i2.ShowtimeSeat>? showtimeSeats,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Showtime',
      if (id != null) 'id': id,
      'movieId': movieId,
      'roomId': roomId,
      'startTime': startTime.toJson(),
      'basePrice': basePrice,
      if (showtimeSeats != null)
        'showtimeSeats': showtimeSeats?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ShowtimeImpl extends Showtime {
  _ShowtimeImpl({
    int? id,
    required int movieId,
    required int roomId,
    required DateTime startTime,
    required double basePrice,
    List<_i2.ShowtimeSeat>? showtimeSeats,
  }) : super._(
         id: id,
         movieId: movieId,
         roomId: roomId,
         startTime: startTime,
         basePrice: basePrice,
         showtimeSeats: showtimeSeats,
       );

  /// Returns a shallow copy of this [Showtime]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Showtime copyWith({
    Object? id = _Undefined,
    int? movieId,
    int? roomId,
    DateTime? startTime,
    double? basePrice,
    Object? showtimeSeats = _Undefined,
  }) {
    return Showtime(
      id: id is int? ? id : this.id,
      movieId: movieId ?? this.movieId,
      roomId: roomId ?? this.roomId,
      startTime: startTime ?? this.startTime,
      basePrice: basePrice ?? this.basePrice,
      showtimeSeats: showtimeSeats is List<_i2.ShowtimeSeat>?
          ? showtimeSeats
          : this.showtimeSeats?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
