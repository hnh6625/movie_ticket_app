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

abstract class Seat implements _i1.SerializableModel {
  Seat._({
    this.id,
    required this.roomId,
    required this.rowLabel,
    required this.seatNumber,
    required this.seatType,
    this.showtimeSeats,
  });

  factory Seat({
    int? id,
    required int roomId,
    required String rowLabel,
    required int seatNumber,
    required String seatType,
    List<_i2.ShowtimeSeat>? showtimeSeats,
  }) = _SeatImpl;

  factory Seat.fromJson(Map<String, dynamic> jsonSerialization) {
    return Seat(
      id: jsonSerialization['id'] as int?,
      roomId: jsonSerialization['roomId'] as int,
      rowLabel: jsonSerialization['rowLabel'] as String,
      seatNumber: jsonSerialization['seatNumber'] as int,
      seatType: jsonSerialization['seatType'] as String,
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

  int roomId;

  String rowLabel;

  int seatNumber;

  String seatType;

  List<_i2.ShowtimeSeat>? showtimeSeats;

  /// Returns a shallow copy of this [Seat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Seat copyWith({
    int? id,
    int? roomId,
    String? rowLabel,
    int? seatNumber,
    String? seatType,
    List<_i2.ShowtimeSeat>? showtimeSeats,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Seat',
      if (id != null) 'id': id,
      'roomId': roomId,
      'rowLabel': rowLabel,
      'seatNumber': seatNumber,
      'seatType': seatType,
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

class _SeatImpl extends Seat {
  _SeatImpl({
    int? id,
    required int roomId,
    required String rowLabel,
    required int seatNumber,
    required String seatType,
    List<_i2.ShowtimeSeat>? showtimeSeats,
  }) : super._(
         id: id,
         roomId: roomId,
         rowLabel: rowLabel,
         seatNumber: seatNumber,
         seatType: seatType,
         showtimeSeats: showtimeSeats,
       );

  /// Returns a shallow copy of this [Seat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Seat copyWith({
    Object? id = _Undefined,
    int? roomId,
    String? rowLabel,
    int? seatNumber,
    String? seatType,
    Object? showtimeSeats = _Undefined,
  }) {
    return Seat(
      id: id is int? ? id : this.id,
      roomId: roomId ?? this.roomId,
      rowLabel: rowLabel ?? this.rowLabel,
      seatNumber: seatNumber ?? this.seatNumber,
      seatType: seatType ?? this.seatType,
      showtimeSeats: showtimeSeats is List<_i2.ShowtimeSeat>?
          ? showtimeSeats
          : this.showtimeSeats?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
