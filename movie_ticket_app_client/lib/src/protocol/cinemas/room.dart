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
import '../cinemas/seat.dart' as _i2;
import '../showtimes/showtime.dart' as _i3;
import 'package:movie_ticket_app_client/src/protocol/protocol.dart' as _i4;

abstract class Room implements _i1.SerializableModel {
  Room._({
    this.id,
    required this.cinemaId,
    required this.name,
    required this.roomType,
    this.seats,
    this.showtimes,
  });

  factory Room({
    int? id,
    required int cinemaId,
    required String name,
    required String roomType,
    List<_i2.Seat>? seats,
    List<_i3.Showtime>? showtimes,
  }) = _RoomImpl;

  factory Room.fromJson(Map<String, dynamic> jsonSerialization) {
    return Room(
      id: jsonSerialization['id'] as int?,
      cinemaId: jsonSerialization['cinemaId'] as int,
      name: jsonSerialization['name'] as String,
      roomType: jsonSerialization['roomType'] as String,
      seats: jsonSerialization['seats'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i2.Seat>>(
              jsonSerialization['seats'],
            ),
      showtimes: jsonSerialization['showtimes'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.Showtime>>(
              jsonSerialization['showtimes'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int cinemaId;

  String name;

  String roomType;

  List<_i2.Seat>? seats;

  List<_i3.Showtime>? showtimes;

  /// Returns a shallow copy of this [Room]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Room copyWith({
    int? id,
    int? cinemaId,
    String? name,
    String? roomType,
    List<_i2.Seat>? seats,
    List<_i3.Showtime>? showtimes,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Room',
      if (id != null) 'id': id,
      'cinemaId': cinemaId,
      'name': name,
      'roomType': roomType,
      if (seats != null) 'seats': seats?.toJson(valueToJson: (v) => v.toJson()),
      if (showtimes != null)
        'showtimes': showtimes?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RoomImpl extends Room {
  _RoomImpl({
    int? id,
    required int cinemaId,
    required String name,
    required String roomType,
    List<_i2.Seat>? seats,
    List<_i3.Showtime>? showtimes,
  }) : super._(
         id: id,
         cinemaId: cinemaId,
         name: name,
         roomType: roomType,
         seats: seats,
         showtimes: showtimes,
       );

  /// Returns a shallow copy of this [Room]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Room copyWith({
    Object? id = _Undefined,
    int? cinemaId,
    String? name,
    String? roomType,
    Object? seats = _Undefined,
    Object? showtimes = _Undefined,
  }) {
    return Room(
      id: id is int? ? id : this.id,
      cinemaId: cinemaId ?? this.cinemaId,
      name: name ?? this.name,
      roomType: roomType ?? this.roomType,
      seats: seats is List<_i2.Seat>?
          ? seats
          : this.seats?.map((e0) => e0.copyWith()).toList(),
      showtimes: showtimes is List<_i3.Showtime>?
          ? showtimes
          : this.showtimes?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
