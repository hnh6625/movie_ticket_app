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

abstract class OrderUsedPayload implements _i1.SerializableModel {
  OrderUsedPayload._({required this.orderId});

  factory OrderUsedPayload({required int orderId}) = _OrderUsedPayloadImpl;

  factory OrderUsedPayload.fromJson(Map<String, dynamic> jsonSerialization) {
    return OrderUsedPayload(orderId: jsonSerialization['orderId'] as int);
  }

  int orderId;

  /// Returns a shallow copy of this [OrderUsedPayload]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  OrderUsedPayload copyWith({int? orderId});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OrderUsedPayload',
      'orderId': orderId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _OrderUsedPayloadImpl extends OrderUsedPayload {
  _OrderUsedPayloadImpl({required int orderId}) : super._(orderId: orderId);

  /// Returns a shallow copy of this [OrderUsedPayload]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  OrderUsedPayload copyWith({int? orderId}) {
    return OrderUsedPayload(orderId: orderId ?? this.orderId);
  }
}
