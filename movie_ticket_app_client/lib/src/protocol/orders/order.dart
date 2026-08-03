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
import '../orders/order_seat.dart' as _i2;
import '../orders/order_concession.dart' as _i3;
import 'package:movie_ticket_app_client/src/protocol/protocol.dart' as _i4;

abstract class Order implements _i1.SerializableModel {
  Order._({
    this.id,
    required this.userIdentifier,
    required this.showtimeId,
    required this.totalPrice,
    required this.status,
    required this.paymentMethod,
    this.qrCodeData,
    required this.createdAt,
    this.orderSeats,
    this.orderConcessions,
  });

  factory Order({
    int? id,
    required String userIdentifier,
    required int showtimeId,
    required double totalPrice,
    required String status,
    required String paymentMethod,
    String? qrCodeData,
    required DateTime createdAt,
    List<_i2.OrderSeat>? orderSeats,
    List<_i3.OrderConcession>? orderConcessions,
  }) = _OrderImpl;

  factory Order.fromJson(Map<String, dynamic> jsonSerialization) {
    return Order(
      id: jsonSerialization['id'] as int?,
      userIdentifier: jsonSerialization['userIdentifier'] as String,
      showtimeId: jsonSerialization['showtimeId'] as int,
      totalPrice: (jsonSerialization['totalPrice'] as num).toDouble(),
      status: jsonSerialization['status'] as String,
      paymentMethod: jsonSerialization['paymentMethod'] as String,
      qrCodeData: jsonSerialization['qrCodeData'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      orderSeats: jsonSerialization['orderSeats'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i2.OrderSeat>>(
              jsonSerialization['orderSeats'],
            ),
      orderConcessions: jsonSerialization['orderConcessions'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.OrderConcession>>(
              jsonSerialization['orderConcessions'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String userIdentifier;

  int showtimeId;

  double totalPrice;

  String status;

  String paymentMethod;

  String? qrCodeData;

  DateTime createdAt;

  List<_i2.OrderSeat>? orderSeats;

  List<_i3.OrderConcession>? orderConcessions;

  /// Returns a shallow copy of this [Order]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Order copyWith({
    int? id,
    String? userIdentifier,
    int? showtimeId,
    double? totalPrice,
    String? status,
    String? paymentMethod,
    String? qrCodeData,
    DateTime? createdAt,
    List<_i2.OrderSeat>? orderSeats,
    List<_i3.OrderConcession>? orderConcessions,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Order',
      if (id != null) 'id': id,
      'userIdentifier': userIdentifier,
      'showtimeId': showtimeId,
      'totalPrice': totalPrice,
      'status': status,
      'paymentMethod': paymentMethod,
      if (qrCodeData != null) 'qrCodeData': qrCodeData,
      'createdAt': createdAt.toJson(),
      if (orderSeats != null)
        'orderSeats': orderSeats?.toJson(valueToJson: (v) => v.toJson()),
      if (orderConcessions != null)
        'orderConcessions': orderConcessions?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OrderImpl extends Order {
  _OrderImpl({
    int? id,
    required String userIdentifier,
    required int showtimeId,
    required double totalPrice,
    required String status,
    required String paymentMethod,
    String? qrCodeData,
    required DateTime createdAt,
    List<_i2.OrderSeat>? orderSeats,
    List<_i3.OrderConcession>? orderConcessions,
  }) : super._(
         id: id,
         userIdentifier: userIdentifier,
         showtimeId: showtimeId,
         totalPrice: totalPrice,
         status: status,
         paymentMethod: paymentMethod,
         qrCodeData: qrCodeData,
         createdAt: createdAt,
         orderSeats: orderSeats,
         orderConcessions: orderConcessions,
       );

  /// Returns a shallow copy of this [Order]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Order copyWith({
    Object? id = _Undefined,
    String? userIdentifier,
    int? showtimeId,
    double? totalPrice,
    String? status,
    String? paymentMethod,
    Object? qrCodeData = _Undefined,
    DateTime? createdAt,
    Object? orderSeats = _Undefined,
    Object? orderConcessions = _Undefined,
  }) {
    return Order(
      id: id is int? ? id : this.id,
      userIdentifier: userIdentifier ?? this.userIdentifier,
      showtimeId: showtimeId ?? this.showtimeId,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      qrCodeData: qrCodeData is String? ? qrCodeData : this.qrCodeData,
      createdAt: createdAt ?? this.createdAt,
      orderSeats: orderSeats is List<_i2.OrderSeat>?
          ? orderSeats
          : this.orderSeats?.map((e0) => e0.copyWith()).toList(),
      orderConcessions: orderConcessions is List<_i3.OrderConcession>?
          ? orderConcessions
          : this.orderConcessions?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
