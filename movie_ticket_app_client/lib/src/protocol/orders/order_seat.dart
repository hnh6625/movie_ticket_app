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

abstract class OrderSeat implements _i1.SerializableModel {
  OrderSeat._({
    this.id,
    required this.orderId,
    required this.showtimeSeatId,
    required this.price,
  });

  factory OrderSeat({
    int? id,
    required int orderId,
    required int showtimeSeatId,
    required double price,
  }) = _OrderSeatImpl;

  factory OrderSeat.fromJson(Map<String, dynamic> jsonSerialization) {
    return OrderSeat(
      id: jsonSerialization['id'] as int?,
      orderId: jsonSerialization['orderId'] as int,
      showtimeSeatId: jsonSerialization['showtimeSeatId'] as int,
      price: (jsonSerialization['price'] as num).toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int orderId;

  int showtimeSeatId;

  double price;

  /// Returns a shallow copy of this [OrderSeat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  OrderSeat copyWith({
    int? id,
    int? orderId,
    int? showtimeSeatId,
    double? price,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OrderSeat',
      if (id != null) 'id': id,
      'orderId': orderId,
      'showtimeSeatId': showtimeSeatId,
      'price': price,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OrderSeatImpl extends OrderSeat {
  _OrderSeatImpl({
    int? id,
    required int orderId,
    required int showtimeSeatId,
    required double price,
  }) : super._(
         id: id,
         orderId: orderId,
         showtimeSeatId: showtimeSeatId,
         price: price,
       );

  /// Returns a shallow copy of this [OrderSeat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  OrderSeat copyWith({
    Object? id = _Undefined,
    int? orderId,
    int? showtimeSeatId,
    double? price,
  }) {
    return OrderSeat(
      id: id is int? ? id : this.id,
      orderId: orderId ?? this.orderId,
      showtimeSeatId: showtimeSeatId ?? this.showtimeSeatId,
      price: price ?? this.price,
    );
  }
}
