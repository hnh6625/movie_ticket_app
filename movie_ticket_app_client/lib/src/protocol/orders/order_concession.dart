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

abstract class OrderConcession implements _i1.SerializableModel {
  OrderConcession._({
    this.id,
    required this.orderId,
    required this.concessionId,
    required this.quantity,
    required this.price,
  });

  factory OrderConcession({
    int? id,
    required int orderId,
    required int concessionId,
    required int quantity,
    required double price,
  }) = _OrderConcessionImpl;

  factory OrderConcession.fromJson(Map<String, dynamic> jsonSerialization) {
    return OrderConcession(
      id: jsonSerialization['id'] as int?,
      orderId: jsonSerialization['orderId'] as int,
      concessionId: jsonSerialization['concessionId'] as int,
      quantity: jsonSerialization['quantity'] as int,
      price: (jsonSerialization['price'] as num).toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int orderId;

  int concessionId;

  int quantity;

  double price;

  /// Returns a shallow copy of this [OrderConcession]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  OrderConcession copyWith({
    int? id,
    int? orderId,
    int? concessionId,
    int? quantity,
    double? price,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OrderConcession',
      if (id != null) 'id': id,
      'orderId': orderId,
      'concessionId': concessionId,
      'quantity': quantity,
      'price': price,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OrderConcessionImpl extends OrderConcession {
  _OrderConcessionImpl({
    int? id,
    required int orderId,
    required int concessionId,
    required int quantity,
    required double price,
  }) : super._(
         id: id,
         orderId: orderId,
         concessionId: concessionId,
         quantity: quantity,
         price: price,
       );

  /// Returns a shallow copy of this [OrderConcession]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  OrderConcession copyWith({
    Object? id = _Undefined,
    int? orderId,
    int? concessionId,
    int? quantity,
    double? price,
  }) {
    return OrderConcession(
      id: id is int? ? id : this.id,
      orderId: orderId ?? this.orderId,
      concessionId: concessionId ?? this.concessionId,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }
}
