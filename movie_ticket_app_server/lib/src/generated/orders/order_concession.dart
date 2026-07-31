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

abstract class OrderConcession
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = OrderConcessionTable();

  static const db = OrderConcessionRepository._();

  @override
  int? id;

  int orderId;

  int concessionId;

  int quantity;

  double price;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'OrderConcession',
      if (id != null) 'id': id,
      'orderId': orderId,
      'concessionId': concessionId,
      'quantity': quantity,
      'price': price,
    };
  }

  static OrderConcessionInclude include() {
    return OrderConcessionInclude._();
  }

  static OrderConcessionIncludeList includeList({
    _i1.WhereExpressionBuilder<OrderConcessionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderConcessionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderConcessionTable>? orderByList,
    OrderConcessionInclude? include,
  }) {
    return OrderConcessionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(OrderConcession.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(OrderConcession.t),
      include: include,
    );
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

class OrderConcessionUpdateTable extends _i1.UpdateTable<OrderConcessionTable> {
  OrderConcessionUpdateTable(super.table);

  _i1.ColumnValue<int, int> orderId(int value) => _i1.ColumnValue(
    table.orderId,
    value,
  );

  _i1.ColumnValue<int, int> concessionId(int value) => _i1.ColumnValue(
    table.concessionId,
    value,
  );

  _i1.ColumnValue<int, int> quantity(int value) => _i1.ColumnValue(
    table.quantity,
    value,
  );

  _i1.ColumnValue<double, double> price(double value) => _i1.ColumnValue(
    table.price,
    value,
  );
}

class OrderConcessionTable extends _i1.Table<int?> {
  OrderConcessionTable({super.tableRelation})
    : super(tableName: 'order_concessions') {
    updateTable = OrderConcessionUpdateTable(this);
    orderId = _i1.ColumnInt(
      'orderId',
      this,
    );
    concessionId = _i1.ColumnInt(
      'concessionId',
      this,
    );
    quantity = _i1.ColumnInt(
      'quantity',
      this,
    );
    price = _i1.ColumnDouble(
      'price',
      this,
    );
  }

  late final OrderConcessionUpdateTable updateTable;

  late final _i1.ColumnInt orderId;

  late final _i1.ColumnInt concessionId;

  late final _i1.ColumnInt quantity;

  late final _i1.ColumnDouble price;

  @override
  List<_i1.Column> get columns => [
    id,
    orderId,
    concessionId,
    quantity,
    price,
  ];
}

class OrderConcessionInclude extends _i1.IncludeObject {
  OrderConcessionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => OrderConcession.t;
}

class OrderConcessionIncludeList extends _i1.IncludeList {
  OrderConcessionIncludeList._({
    _i1.WhereExpressionBuilder<OrderConcessionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(OrderConcession.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => OrderConcession.t;
}

class OrderConcessionRepository {
  const OrderConcessionRepository._();

  /// Returns a list of [OrderConcession]s matching the given query parameters.
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
  Future<List<OrderConcession>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<OrderConcessionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderConcessionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderConcessionTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<OrderConcession>(
      where: where?.call(OrderConcession.t),
      orderBy: orderBy?.call(OrderConcession.t),
      orderByList: orderByList?.call(OrderConcession.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [OrderConcession] matching the given query parameters.
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
  Future<OrderConcession?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<OrderConcessionTable>? where,
    int? offset,
    _i1.OrderByBuilder<OrderConcessionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderConcessionTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<OrderConcession>(
      where: where?.call(OrderConcession.t),
      orderBy: orderBy?.call(OrderConcession.t),
      orderByList: orderByList?.call(OrderConcession.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [OrderConcession] by its [id] or null if no such row exists.
  Future<OrderConcession?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<OrderConcession>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [OrderConcession]s in the list and returns the inserted rows.
  ///
  /// The returned [OrderConcession]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<OrderConcession>> insert(
    _i1.DatabaseSession session,
    List<OrderConcession> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<OrderConcession>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [OrderConcession] and returns the inserted row.
  ///
  /// The returned [OrderConcession] will have its `id` field set.
  Future<OrderConcession> insertRow(
    _i1.DatabaseSession session,
    OrderConcession row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<OrderConcession>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [OrderConcession]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<OrderConcession>> update(
    _i1.DatabaseSession session,
    List<OrderConcession> rows, {
    _i1.ColumnSelections<OrderConcessionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<OrderConcession>(
      rows,
      columns: columns?.call(OrderConcession.t),
      transaction: transaction,
    );
  }

  /// Updates a single [OrderConcession]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<OrderConcession> updateRow(
    _i1.DatabaseSession session,
    OrderConcession row, {
    _i1.ColumnSelections<OrderConcessionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<OrderConcession>(
      row,
      columns: columns?.call(OrderConcession.t),
      transaction: transaction,
    );
  }

  /// Updates a single [OrderConcession] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<OrderConcession?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<OrderConcessionUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<OrderConcession>(
      id,
      columnValues: columnValues(OrderConcession.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [OrderConcession]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<OrderConcession>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<OrderConcessionUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<OrderConcessionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderConcessionTable>? orderBy,
    _i1.OrderByListBuilder<OrderConcessionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<OrderConcession>(
      columnValues: columnValues(OrderConcession.t.updateTable),
      where: where(OrderConcession.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(OrderConcession.t),
      orderByList: orderByList?.call(OrderConcession.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [OrderConcession]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<OrderConcession>> delete(
    _i1.DatabaseSession session,
    List<OrderConcession> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<OrderConcession>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [OrderConcession].
  Future<OrderConcession> deleteRow(
    _i1.DatabaseSession session,
    OrderConcession row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<OrderConcession>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<OrderConcession>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<OrderConcessionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<OrderConcession>(
      where: where(OrderConcession.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<OrderConcessionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<OrderConcession>(
      where: where?.call(OrderConcession.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [OrderConcession] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<OrderConcessionTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<OrderConcession>(
      where: where(OrderConcession.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
