/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../orders/order_seat.dart' as _i2;
import '../orders/order_concession.dart' as _i3;
import 'package:movie_ticket_app_server/src/generated/protocol.dart' as _i4;

abstract class Order implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = OrderTable();

  static const db = OrderRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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
        'orderSeats': orderSeats?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (orderConcessions != null)
        'orderConcessions': orderConcessions?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static OrderInclude include({
    _i2.OrderSeatIncludeList? orderSeats,
    _i3.OrderConcessionIncludeList? orderConcessions,
  }) {
    return OrderInclude._(
      orderSeats: orderSeats,
      orderConcessions: orderConcessions,
    );
  }

  static OrderIncludeList includeList({
    _i1.WhereExpressionBuilder<OrderTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderTable>? orderByList,
    OrderInclude? include,
  }) {
    return OrderIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Order.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Order.t),
      include: include,
    );
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

class OrderUpdateTable extends _i1.UpdateTable<OrderTable> {
  OrderUpdateTable(super.table);

  _i1.ColumnValue<String, String> userIdentifier(String value) =>
      _i1.ColumnValue(
        table.userIdentifier,
        value,
      );

  _i1.ColumnValue<int, int> showtimeId(int value) => _i1.ColumnValue(
    table.showtimeId,
    value,
  );

  _i1.ColumnValue<double, double> totalPrice(double value) => _i1.ColumnValue(
    table.totalPrice,
    value,
  );

  _i1.ColumnValue<String, String> status(String value) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<String, String> paymentMethod(String value) =>
      _i1.ColumnValue(
        table.paymentMethod,
        value,
      );

  _i1.ColumnValue<String, String> qrCodeData(String? value) => _i1.ColumnValue(
    table.qrCodeData,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class OrderTable extends _i1.Table<int?> {
  OrderTable({super.tableRelation}) : super(tableName: 'orders') {
    updateTable = OrderUpdateTable(this);
    userIdentifier = _i1.ColumnString(
      'userIdentifier',
      this,
    );
    showtimeId = _i1.ColumnInt(
      'showtimeId',
      this,
    );
    totalPrice = _i1.ColumnDouble(
      'totalPrice',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    paymentMethod = _i1.ColumnString(
      'paymentMethod',
      this,
    );
    qrCodeData = _i1.ColumnString(
      'qrCodeData',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final OrderUpdateTable updateTable;

  late final _i1.ColumnString userIdentifier;

  late final _i1.ColumnInt showtimeId;

  late final _i1.ColumnDouble totalPrice;

  late final _i1.ColumnString status;

  late final _i1.ColumnString paymentMethod;

  late final _i1.ColumnString qrCodeData;

  late final _i1.ColumnDateTime createdAt;

  _i2.OrderSeatTable? ___orderSeats;

  _i1.ManyRelation<_i2.OrderSeatTable>? _orderSeats;

  _i3.OrderConcessionTable? ___orderConcessions;

  _i1.ManyRelation<_i3.OrderConcessionTable>? _orderConcessions;

  _i2.OrderSeatTable get __orderSeats {
    if (___orderSeats != null) return ___orderSeats!;
    ___orderSeats = _i1.createRelationTable(
      relationFieldName: '__orderSeats',
      field: Order.t.id,
      foreignField: _i2.OrderSeat.t.orderId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.OrderSeatTable(tableRelation: foreignTableRelation),
    );
    return ___orderSeats!;
  }

  _i3.OrderConcessionTable get __orderConcessions {
    if (___orderConcessions != null) return ___orderConcessions!;
    ___orderConcessions = _i1.createRelationTable(
      relationFieldName: '__orderConcessions',
      field: Order.t.id,
      foreignField: _i3.OrderConcession.t.orderId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.OrderConcessionTable(tableRelation: foreignTableRelation),
    );
    return ___orderConcessions!;
  }

  _i1.ManyRelation<_i2.OrderSeatTable> get orderSeats {
    if (_orderSeats != null) return _orderSeats!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'orderSeats',
      field: Order.t.id,
      foreignField: _i2.OrderSeat.t.orderId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.OrderSeatTable(tableRelation: foreignTableRelation),
    );
    _orderSeats = _i1.ManyRelation<_i2.OrderSeatTable>(
      tableWithRelations: relationTable,
      table: _i2.OrderSeatTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _orderSeats!;
  }

  _i1.ManyRelation<_i3.OrderConcessionTable> get orderConcessions {
    if (_orderConcessions != null) return _orderConcessions!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'orderConcessions',
      field: Order.t.id,
      foreignField: _i3.OrderConcession.t.orderId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.OrderConcessionTable(tableRelation: foreignTableRelation),
    );
    _orderConcessions = _i1.ManyRelation<_i3.OrderConcessionTable>(
      tableWithRelations: relationTable,
      table: _i3.OrderConcessionTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _orderConcessions!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    userIdentifier,
    showtimeId,
    totalPrice,
    status,
    paymentMethod,
    qrCodeData,
    createdAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'orderSeats') {
      return __orderSeats;
    }
    if (relationField == 'orderConcessions') {
      return __orderConcessions;
    }
    return null;
  }
}

class OrderInclude extends _i1.IncludeObject {
  OrderInclude._({
    _i2.OrderSeatIncludeList? orderSeats,
    _i3.OrderConcessionIncludeList? orderConcessions,
  }) {
    _orderSeats = orderSeats;
    _orderConcessions = orderConcessions;
  }

  _i2.OrderSeatIncludeList? _orderSeats;

  _i3.OrderConcessionIncludeList? _orderConcessions;

  @override
  Map<String, _i1.Include?> get includes => {
    'orderSeats': _orderSeats,
    'orderConcessions': _orderConcessions,
  };

  @override
  _i1.Table<int?> get table => Order.t;
}

class OrderIncludeList extends _i1.IncludeList {
  OrderIncludeList._({
    _i1.WhereExpressionBuilder<OrderTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Order.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Order.t;
}

class OrderRepository {
  const OrderRepository._();

  final attach = const OrderAttachRepository._();

  final attachRow = const OrderAttachRowRepository._();

  /// Returns a list of [Order]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Order>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<OrderTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderTable>? orderByList,
    _i1.Transaction? transaction,
    OrderInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Order>(
      where: where?.call(Order.t),
      orderBy: orderBy?.call(Order.t),
      orderByList: orderByList?.call(Order.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Order] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Order?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<OrderTable>? where,
    int? offset,
    _i1.OrderByBuilder<OrderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderTable>? orderByList,
    _i1.Transaction? transaction,
    OrderInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Order>(
      where: where?.call(Order.t),
      orderBy: orderBy?.call(Order.t),
      orderByList: orderByList?.call(Order.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Order] by its [id] or null if no such row exists.
  Future<Order?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    OrderInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Order>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Order]s in the list and returns the inserted rows.
  ///
  /// The returned [Order]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Order>> insert(
    _i1.DatabaseSession session,
    List<Order> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Order>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Order] and returns the inserted row.
  ///
  /// The returned [Order] will have its `id` field set.
  Future<Order> insertRow(
    _i1.DatabaseSession session,
    Order row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Order>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Order]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Order>> update(
    _i1.DatabaseSession session,
    List<Order> rows, {
    _i1.ColumnSelections<OrderTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Order>(
      rows,
      columns: columns?.call(Order.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Order]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Order> updateRow(
    _i1.DatabaseSession session,
    Order row, {
    _i1.ColumnSelections<OrderTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Order>(
      row,
      columns: columns?.call(Order.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Order] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Order?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<OrderUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Order>(
      id,
      columnValues: columnValues(Order.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Order]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Order>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<OrderUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<OrderTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderTable>? orderBy,
    _i1.OrderByListBuilder<OrderTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Order>(
      columnValues: columnValues(Order.t.updateTable),
      where: where(Order.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Order.t),
      orderByList: orderByList?.call(Order.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Order]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Order>> delete(
    _i1.DatabaseSession session,
    List<Order> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Order>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Order].
  Future<Order> deleteRow(
    _i1.DatabaseSession session,
    Order row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Order>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Order>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<OrderTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Order>(
      where: where(Order.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<OrderTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Order>(
      where: where?.call(Order.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Order] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<OrderTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Order>(
      where: where(Order.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class OrderAttachRepository {
  const OrderAttachRepository._();

  /// Creates a relation between this [Order] and the given [OrderSeat]s
  /// by setting each [OrderSeat]'s foreign key `orderId` to refer to this [Order].
  Future<void> orderSeats(
    _i1.DatabaseSession session,
    Order order,
    List<_i2.OrderSeat> orderSeat, {
    _i1.Transaction? transaction,
  }) async {
    if (orderSeat.any((e) => e.id == null)) {
      throw ArgumentError.notNull('orderSeat.id');
    }
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }

    var $orderSeat = orderSeat
        .map((e) => e.copyWith(orderId: order.id))
        .toList();
    await session.db.update<_i2.OrderSeat>(
      $orderSeat,
      columns: [_i2.OrderSeat.t.orderId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Order] and the given [OrderConcession]s
  /// by setting each [OrderConcession]'s foreign key `orderId` to refer to this [Order].
  Future<void> orderConcessions(
    _i1.DatabaseSession session,
    Order order,
    List<_i3.OrderConcession> orderConcession, {
    _i1.Transaction? transaction,
  }) async {
    if (orderConcession.any((e) => e.id == null)) {
      throw ArgumentError.notNull('orderConcession.id');
    }
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }

    var $orderConcession = orderConcession
        .map((e) => e.copyWith(orderId: order.id))
        .toList();
    await session.db.update<_i3.OrderConcession>(
      $orderConcession,
      columns: [_i3.OrderConcession.t.orderId],
      transaction: transaction,
    );
  }
}

class OrderAttachRowRepository {
  const OrderAttachRowRepository._();

  /// Creates a relation between this [Order] and the given [OrderSeat]
  /// by setting the [OrderSeat]'s foreign key `orderId` to refer to this [Order].
  Future<void> orderSeats(
    _i1.DatabaseSession session,
    Order order,
    _i2.OrderSeat orderSeat, {
    _i1.Transaction? transaction,
  }) async {
    if (orderSeat.id == null) {
      throw ArgumentError.notNull('orderSeat.id');
    }
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }

    var $orderSeat = orderSeat.copyWith(orderId: order.id);
    await session.db.updateRow<_i2.OrderSeat>(
      $orderSeat,
      columns: [_i2.OrderSeat.t.orderId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Order] and the given [OrderConcession]
  /// by setting the [OrderConcession]'s foreign key `orderId` to refer to this [Order].
  Future<void> orderConcessions(
    _i1.DatabaseSession session,
    Order order,
    _i3.OrderConcession orderConcession, {
    _i1.Transaction? transaction,
  }) async {
    if (orderConcession.id == null) {
      throw ArgumentError.notNull('orderConcession.id');
    }
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }

    var $orderConcession = orderConcession.copyWith(orderId: order.id);
    await session.db.updateRow<_i3.OrderConcession>(
      $orderConcession,
      columns: [_i3.OrderConcession.t.orderId],
      transaction: transaction,
    );
  }
}
