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

abstract class OrderSeat
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = OrderSeatTable();

  static const db = OrderSeatRepository._();

  @override
  int? id;

  int orderId;

  int showtimeSeatId;

  double price;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'OrderSeat',
      if (id != null) 'id': id,
      'orderId': orderId,
      'showtimeSeatId': showtimeSeatId,
      'price': price,
    };
  }

  static OrderSeatInclude include() {
    return OrderSeatInclude._();
  }

  static OrderSeatIncludeList includeList({
    _i1.WhereExpressionBuilder<OrderSeatTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderSeatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderSeatTable>? orderByList,
    OrderSeatInclude? include,
  }) {
    return OrderSeatIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(OrderSeat.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(OrderSeat.t),
      include: include,
    );
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

class OrderSeatUpdateTable extends _i1.UpdateTable<OrderSeatTable> {
  OrderSeatUpdateTable(super.table);

  _i1.ColumnValue<int, int> orderId(int value) => _i1.ColumnValue(
    table.orderId,
    value,
  );

  _i1.ColumnValue<int, int> showtimeSeatId(int value) => _i1.ColumnValue(
    table.showtimeSeatId,
    value,
  );

  _i1.ColumnValue<double, double> price(double value) => _i1.ColumnValue(
    table.price,
    value,
  );
}

class OrderSeatTable extends _i1.Table<int?> {
  OrderSeatTable({super.tableRelation}) : super(tableName: 'order_seats') {
    updateTable = OrderSeatUpdateTable(this);
    orderId = _i1.ColumnInt(
      'orderId',
      this,
    );
    showtimeSeatId = _i1.ColumnInt(
      'showtimeSeatId',
      this,
    );
    price = _i1.ColumnDouble(
      'price',
      this,
    );
  }

  late final OrderSeatUpdateTable updateTable;

  late final _i1.ColumnInt orderId;

  late final _i1.ColumnInt showtimeSeatId;

  late final _i1.ColumnDouble price;

  @override
  List<_i1.Column> get columns => [
    id,
    orderId,
    showtimeSeatId,
    price,
  ];
}

class OrderSeatInclude extends _i1.IncludeObject {
  OrderSeatInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => OrderSeat.t;
}

class OrderSeatIncludeList extends _i1.IncludeList {
  OrderSeatIncludeList._({
    _i1.WhereExpressionBuilder<OrderSeatTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(OrderSeat.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => OrderSeat.t;
}

class OrderSeatRepository {
  const OrderSeatRepository._();

  /// Returns a list of [OrderSeat]s matching the given query parameters.
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
  Future<List<OrderSeat>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<OrderSeatTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderSeatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderSeatTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<OrderSeat>(
      where: where?.call(OrderSeat.t),
      orderBy: orderBy?.call(OrderSeat.t),
      orderByList: orderByList?.call(OrderSeat.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [OrderSeat] matching the given query parameters.
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
  Future<OrderSeat?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<OrderSeatTable>? where,
    int? offset,
    _i1.OrderByBuilder<OrderSeatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderSeatTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<OrderSeat>(
      where: where?.call(OrderSeat.t),
      orderBy: orderBy?.call(OrderSeat.t),
      orderByList: orderByList?.call(OrderSeat.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [OrderSeat] by its [id] or null if no such row exists.
  Future<OrderSeat?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<OrderSeat>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [OrderSeat]s in the list and returns the inserted rows.
  ///
  /// The returned [OrderSeat]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<OrderSeat>> insert(
    _i1.DatabaseSession session,
    List<OrderSeat> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<OrderSeat>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [OrderSeat] and returns the inserted row.
  ///
  /// The returned [OrderSeat] will have its `id` field set.
  Future<OrderSeat> insertRow(
    _i1.DatabaseSession session,
    OrderSeat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<OrderSeat>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [OrderSeat]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<OrderSeat>> update(
    _i1.DatabaseSession session,
    List<OrderSeat> rows, {
    _i1.ColumnSelections<OrderSeatTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<OrderSeat>(
      rows,
      columns: columns?.call(OrderSeat.t),
      transaction: transaction,
    );
  }

  /// Updates a single [OrderSeat]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<OrderSeat> updateRow(
    _i1.DatabaseSession session,
    OrderSeat row, {
    _i1.ColumnSelections<OrderSeatTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<OrderSeat>(
      row,
      columns: columns?.call(OrderSeat.t),
      transaction: transaction,
    );
  }

  /// Updates a single [OrderSeat] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<OrderSeat?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<OrderSeatUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<OrderSeat>(
      id,
      columnValues: columnValues(OrderSeat.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [OrderSeat]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<OrderSeat>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<OrderSeatUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<OrderSeatTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderSeatTable>? orderBy,
    _i1.OrderByListBuilder<OrderSeatTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<OrderSeat>(
      columnValues: columnValues(OrderSeat.t.updateTable),
      where: where(OrderSeat.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(OrderSeat.t),
      orderByList: orderByList?.call(OrderSeat.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [OrderSeat]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<OrderSeat>> delete(
    _i1.DatabaseSession session,
    List<OrderSeat> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<OrderSeat>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [OrderSeat].
  Future<OrderSeat> deleteRow(
    _i1.DatabaseSession session,
    OrderSeat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<OrderSeat>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<OrderSeat>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<OrderSeatTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<OrderSeat>(
      where: where(OrderSeat.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<OrderSeatTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<OrderSeat>(
      where: where?.call(OrderSeat.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [OrderSeat] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<OrderSeatTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<OrderSeat>(
      where: where(OrderSeat.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
