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
import 'package:serverpod/serverpod.dart' as _i1;

abstract class ReviewCreateResult
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ReviewCreateResult._({
    required this.success,
    this.message,
    this.reviewId,
  });

  factory ReviewCreateResult({
    required bool success,
    String? message,
    int? reviewId,
  }) = _ReviewCreateResultImpl;

  factory ReviewCreateResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return ReviewCreateResult(
      success: _i1.BoolJsonExtension.fromJson(jsonSerialization['success']),
      message: jsonSerialization['message'] as String?,
      reviewId: jsonSerialization['reviewId'] as int?,
    );
  }

  bool success;

  String? message;

  int? reviewId;

  /// Returns a shallow copy of this [ReviewCreateResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ReviewCreateResult copyWith({
    bool? success,
    String? message,
    int? reviewId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ReviewCreateResult',
      'success': success,
      if (message != null) 'message': message,
      if (reviewId != null) 'reviewId': reviewId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ReviewCreateResult',
      'success': success,
      if (message != null) 'message': message,
      if (reviewId != null) 'reviewId': reviewId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ReviewCreateResultImpl extends ReviewCreateResult {
  _ReviewCreateResultImpl({
    required bool success,
    String? message,
    int? reviewId,
  }) : super._(
         success: success,
         message: message,
         reviewId: reviewId,
       );

  /// Returns a shallow copy of this [ReviewCreateResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ReviewCreateResult copyWith({
    bool? success,
    Object? message = _Undefined,
    Object? reviewId = _Undefined,
  }) {
    return ReviewCreateResult(
      success: success ?? this.success,
      message: message is String? ? message : this.message,
      reviewId: reviewId is int? ? reviewId : this.reviewId,
    );
  }
}
