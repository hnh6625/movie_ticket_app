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

abstract class SeatHoldResult implements _i1.SerializableModel {
  SeatHoldResult._({
    required this.success,
    this.message,
    this.expiredAt,
  });

  factory SeatHoldResult({
    required bool success,
    String? message,
    DateTime? expiredAt,
  }) = _SeatHoldResultImpl;

  factory SeatHoldResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return SeatHoldResult(
      success: _i1.BoolJsonExtension.fromJson(jsonSerialization['success']),
      message: jsonSerialization['message'] as String?,
      expiredAt: jsonSerialization['expiredAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiredAt']),
    );
  }

  bool success;

  String? message;

  DateTime? expiredAt;

  /// Returns a shallow copy of this [SeatHoldResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SeatHoldResult copyWith({
    bool? success,
    String? message,
    DateTime? expiredAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SeatHoldResult',
      'success': success,
      if (message != null) 'message': message,
      if (expiredAt != null) 'expiredAt': expiredAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SeatHoldResultImpl extends SeatHoldResult {
  _SeatHoldResultImpl({
    required bool success,
    String? message,
    DateTime? expiredAt,
  }) : super._(
         success: success,
         message: message,
         expiredAt: expiredAt,
       );

  /// Returns a shallow copy of this [SeatHoldResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SeatHoldResult copyWith({
    bool? success,
    Object? message = _Undefined,
    Object? expiredAt = _Undefined,
  }) {
    return SeatHoldResult(
      success: success ?? this.success,
      message: message is String? ? message : this.message,
      expiredAt: expiredAt is DateTime? ? expiredAt : this.expiredAt,
    );
  }
}
