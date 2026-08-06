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

abstract class OrderCreateResult
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  OrderCreateResult._({
    required this.success,
    this.message,
    this.orderId,
    this.totalPrice,
    this.qrCodeData,
  });

  factory OrderCreateResult({
    required bool success,
    String? message,
    int? orderId,
    double? totalPrice,
    String? qrCodeData,
  }) = _OrderCreateResultImpl;

  factory OrderCreateResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return OrderCreateResult(
      success: _i1.BoolJsonExtension.fromJson(jsonSerialization['success']),
      message: jsonSerialization['message'] as String?,
      orderId: jsonSerialization['orderId'] as int?,
      totalPrice: (jsonSerialization['totalPrice'] as num?)?.toDouble(),
      qrCodeData: jsonSerialization['qrCodeData'] as String?,
    );
  }

  bool success;

  String? message;

  int? orderId;

  double? totalPrice;

  String? qrCodeData;

  /// Returns a shallow copy of this [OrderCreateResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  OrderCreateResult copyWith({
    bool? success,
    String? message,
    int? orderId,
    double? totalPrice,
    String? qrCodeData,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OrderCreateResult',
      'success': success,
      if (message != null) 'message': message,
      if (orderId != null) 'orderId': orderId,
      if (totalPrice != null) 'totalPrice': totalPrice,
      if (qrCodeData != null) 'qrCodeData': qrCodeData,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'OrderCreateResult',
      'success': success,
      if (message != null) 'message': message,
      if (orderId != null) 'orderId': orderId,
      if (totalPrice != null) 'totalPrice': totalPrice,
      if (qrCodeData != null) 'qrCodeData': qrCodeData,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OrderCreateResultImpl extends OrderCreateResult {
  _OrderCreateResultImpl({
    required bool success,
    String? message,
    int? orderId,
    double? totalPrice,
    String? qrCodeData,
  }) : super._(
         success: success,
         message: message,
         orderId: orderId,
         totalPrice: totalPrice,
         qrCodeData: qrCodeData,
       );

  /// Returns a shallow copy of this [OrderCreateResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  OrderCreateResult copyWith({
    bool? success,
    Object? message = _Undefined,
    Object? orderId = _Undefined,
    Object? totalPrice = _Undefined,
    Object? qrCodeData = _Undefined,
  }) {
    return OrderCreateResult(
      success: success ?? this.success,
      message: message is String? ? message : this.message,
      orderId: orderId is int? ? orderId : this.orderId,
      totalPrice: totalPrice is double? ? totalPrice : this.totalPrice,
      qrCodeData: qrCodeData is String? ? qrCodeData : this.qrCodeData,
    );
  }
}
