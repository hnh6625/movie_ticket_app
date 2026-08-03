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

abstract class ShowtimeSeat implements _i1.SerializableModel {
  ShowtimeSeat._({
    this.id,
    required this.showtimeId,
    required this.seatId,
    required this.status,
    this.heldByUserId,
    this.holdExpiredAt,
  });

  factory ShowtimeSeat({
    int? id,
    required int showtimeId,
    required int seatId,
    required String status,
    String? heldByUserId,
    DateTime? holdExpiredAt,
  }) = _ShowtimeSeatImpl;

  factory ShowtimeSeat.fromJson(Map<String, dynamic> jsonSerialization) {
    return ShowtimeSeat(
      id: jsonSerialization['id'] as int?,
      showtimeId: jsonSerialization['showtimeId'] as int,
      seatId: jsonSerialization['seatId'] as int,
      status: jsonSerialization['status'] as String,
      heldByUserId: jsonSerialization['heldByUserId'] as String?,
      holdExpiredAt: jsonSerialization['holdExpiredAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['holdExpiredAt'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int showtimeId;

  int seatId;

  String status;

  String? heldByUserId;

  DateTime? holdExpiredAt;

  /// Returns a shallow copy of this [ShowtimeSeat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ShowtimeSeat copyWith({
    int? id,
    int? showtimeId,
    int? seatId,
    String? status,
    String? heldByUserId,
    DateTime? holdExpiredAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ShowtimeSeat',
      if (id != null) 'id': id,
      'showtimeId': showtimeId,
      'seatId': seatId,
      'status': status,
      if (heldByUserId != null) 'heldByUserId': heldByUserId,
      if (holdExpiredAt != null) 'holdExpiredAt': holdExpiredAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ShowtimeSeatImpl extends ShowtimeSeat {
  _ShowtimeSeatImpl({
    int? id,
    required int showtimeId,
    required int seatId,
    required String status,
    String? heldByUserId,
    DateTime? holdExpiredAt,
  }) : super._(
         id: id,
         showtimeId: showtimeId,
         seatId: seatId,
         status: status,
         heldByUserId: heldByUserId,
         holdExpiredAt: holdExpiredAt,
       );

  /// Returns a shallow copy of this [ShowtimeSeat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ShowtimeSeat copyWith({
    Object? id = _Undefined,
    int? showtimeId,
    int? seatId,
    String? status,
    Object? heldByUserId = _Undefined,
    Object? holdExpiredAt = _Undefined,
  }) {
    return ShowtimeSeat(
      id: id is int? ? id : this.id,
      showtimeId: showtimeId ?? this.showtimeId,
      seatId: seatId ?? this.seatId,
      status: status ?? this.status,
      heldByUserId: heldByUserId is String? ? heldByUserId : this.heldByUserId,
      holdExpiredAt: holdExpiredAt is DateTime?
          ? holdExpiredAt
          : this.holdExpiredAt,
    );
  }
}
