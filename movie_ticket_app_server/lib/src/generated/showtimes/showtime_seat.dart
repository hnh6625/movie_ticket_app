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

abstract class ShowtimeSeat
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ShowtimeSeat._({
    this.id,
    required this.showtimeId,
    required this.seatId,
    required this.status,
    this.heldByUserId,
    this.holdExpiredAt,
  });

  factory ShowtimeSeat({
    int? id,
    required int showtimeId,
    required int seatId,
    required String status,
    int? heldByUserId,
    DateTime? holdExpiredAt,
  }) = _ShowtimeSeatImpl;

  factory ShowtimeSeat.fromJson(Map<String, dynamic> jsonSerialization) {
    return ShowtimeSeat(
      id: jsonSerialization['id'] as int?,
      showtimeId: jsonSerialization['showtimeId'] as int,
      seatId: jsonSerialization['seatId'] as int,
      status: jsonSerialization['status'] as String,
      heldByUserId: jsonSerialization['heldByUserId'] as int?,
      holdExpiredAt: jsonSerialization['holdExpiredAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['holdExpiredAt'],
            ),
    );
  }

  static final t = ShowtimeSeatTable();

  static const db = ShowtimeSeatRepository._();

  @override
  int? id;

  int showtimeId;

  int seatId;

  String status;

  int? heldByUserId;

  DateTime? holdExpiredAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ShowtimeSeat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ShowtimeSeat copyWith({
    int? id,
    int? showtimeId,
    int? seatId,
    String? status,
    int? heldByUserId,
    DateTime? holdExpiredAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ShowtimeSeat',
      if (id != null) 'id': id,
      'showtimeId': showtimeId,
      'seatId': seatId,
      'status': status,
      if (heldByUserId != null) 'heldByUserId': heldByUserId,
      if (holdExpiredAt != null) 'holdExpiredAt': holdExpiredAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ShowtimeSeat',
      if (id != null) 'id': id,
      'showtimeId': showtimeId,
      'seatId': seatId,
      'status': status,
      if (heldByUserId != null) 'heldByUserId': heldByUserId,
      if (holdExpiredAt != null) 'holdExpiredAt': holdExpiredAt?.toJson(),
    };
  }

  static ShowtimeSeatInclude include() {
    return ShowtimeSeatInclude._();
  }

  static ShowtimeSeatIncludeList includeList({
    _i1.WhereExpressionBuilder<ShowtimeSeatTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ShowtimeSeatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ShowtimeSeatTable>? orderByList,
    ShowtimeSeatInclude? include,
  }) {
    return ShowtimeSeatIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ShowtimeSeat.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ShowtimeSeat.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ShowtimeSeatImpl extends ShowtimeSeat {
  _ShowtimeSeatImpl({
    int? id,
    required int showtimeId,
    required int seatId,
    required String status,
    int? heldByUserId,
    DateTime? holdExpiredAt,
  }) : super._(
         id: id,
         showtimeId: showtimeId,
         seatId: seatId,
         status: status,
         heldByUserId: heldByUserId,
         holdExpiredAt: holdExpiredAt,
       );

  /// Returns a shallow copy of this [ShowtimeSeat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ShowtimeSeat copyWith({
    Object? id = _Undefined,
    int? showtimeId,
    int? seatId,
    String? status,
    Object? heldByUserId = _Undefined,
    Object? holdExpiredAt = _Undefined,
  }) {
    return ShowtimeSeat(
      id: id is int? ? id : this.id,
      showtimeId: showtimeId ?? this.showtimeId,
      seatId: seatId ?? this.seatId,
      status: status ?? this.status,
      heldByUserId: heldByUserId is int? ? heldByUserId : this.heldByUserId,
      holdExpiredAt: holdExpiredAt is DateTime?
          ? holdExpiredAt
          : this.holdExpiredAt,
    );
  }
}

class ShowtimeSeatUpdateTable extends _i1.UpdateTable<ShowtimeSeatTable> {
  ShowtimeSeatUpdateTable(super.table);

  _i1.ColumnValue<int, int> showtimeId(int value) => _i1.ColumnValue(
    table.showtimeId,
    value,
  );

  _i1.ColumnValue<int, int> seatId(int value) => _i1.ColumnValue(
    table.seatId,
    value,
  );

  _i1.ColumnValue<String, String> status(String value) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<int, int> heldByUserId(int? value) => _i1.ColumnValue(
    table.heldByUserId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> holdExpiredAt(DateTime? value) =>
      _i1.ColumnValue(
        table.holdExpiredAt,
        value,
      );
}

class ShowtimeSeatTable extends _i1.Table<int?> {
  ShowtimeSeatTable({super.tableRelation})
    : super(tableName: 'showtime_seats') {
    updateTable = ShowtimeSeatUpdateTable(this);
    showtimeId = _i1.ColumnInt(
      'showtimeId',
      this,
    );
    seatId = _i1.ColumnInt(
      'seatId',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    heldByUserId = _i1.ColumnInt(
      'heldByUserId',
      this,
    );
    holdExpiredAt = _i1.ColumnDateTime(
      'holdExpiredAt',
      this,
    );
  }

  late final ShowtimeSeatUpdateTable updateTable;

  late final _i1.ColumnInt showtimeId;

  late final _i1.ColumnInt seatId;

  late final _i1.ColumnString status;

  late final _i1.ColumnInt heldByUserId;

  late final _i1.ColumnDateTime holdExpiredAt;

  @override
  List<_i1.Column> get columns => [
    id,
    showtimeId,
    seatId,
    status,
    heldByUserId,
    holdExpiredAt,
  ];
}

class ShowtimeSeatInclude extends _i1.IncludeObject {
  ShowtimeSeatInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ShowtimeSeat.t;
}

class ShowtimeSeatIncludeList extends _i1.IncludeList {
  ShowtimeSeatIncludeList._({
    _i1.WhereExpressionBuilder<ShowtimeSeatTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ShowtimeSeat.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ShowtimeSeat.t;
}

class ShowtimeSeatRepository {
  const ShowtimeSeatRepository._();

  /// Returns a list of [ShowtimeSeat]s matching the given query parameters.
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
  Future<List<ShowtimeSeat>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ShowtimeSeatTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ShowtimeSeatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ShowtimeSeatTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ShowtimeSeat>(
      where: where?.call(ShowtimeSeat.t),
      orderBy: orderBy?.call(ShowtimeSeat.t),
      orderByList: orderByList?.call(ShowtimeSeat.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [ShowtimeSeat] matching the given query parameters.
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
  Future<ShowtimeSeat?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ShowtimeSeatTable>? where,
    int? offset,
    _i1.OrderByBuilder<ShowtimeSeatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ShowtimeSeatTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ShowtimeSeat>(
      where: where?.call(ShowtimeSeat.t),
      orderBy: orderBy?.call(ShowtimeSeat.t),
      orderByList: orderByList?.call(ShowtimeSeat.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ShowtimeSeat] by its [id] or null if no such row exists.
  Future<ShowtimeSeat?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ShowtimeSeat>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ShowtimeSeat]s in the list and returns the inserted rows.
  ///
  /// The returned [ShowtimeSeat]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<ShowtimeSeat>> insert(
    _i1.DatabaseSession session,
    List<ShowtimeSeat> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<ShowtimeSeat>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [ShowtimeSeat] and returns the inserted row.
  ///
  /// The returned [ShowtimeSeat] will have its `id` field set.
  Future<ShowtimeSeat> insertRow(
    _i1.DatabaseSession session,
    ShowtimeSeat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ShowtimeSeat>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ShowtimeSeat]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ShowtimeSeat>> update(
    _i1.DatabaseSession session,
    List<ShowtimeSeat> rows, {
    _i1.ColumnSelections<ShowtimeSeatTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ShowtimeSeat>(
      rows,
      columns: columns?.call(ShowtimeSeat.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ShowtimeSeat]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ShowtimeSeat> updateRow(
    _i1.DatabaseSession session,
    ShowtimeSeat row, {
    _i1.ColumnSelections<ShowtimeSeatTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ShowtimeSeat>(
      row,
      columns: columns?.call(ShowtimeSeat.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ShowtimeSeat] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ShowtimeSeat?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<ShowtimeSeatUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ShowtimeSeat>(
      id,
      columnValues: columnValues(ShowtimeSeat.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ShowtimeSeat]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ShowtimeSeat>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<ShowtimeSeatUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ShowtimeSeatTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ShowtimeSeatTable>? orderBy,
    _i1.OrderByListBuilder<ShowtimeSeatTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ShowtimeSeat>(
      columnValues: columnValues(ShowtimeSeat.t.updateTable),
      where: where(ShowtimeSeat.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ShowtimeSeat.t),
      orderByList: orderByList?.call(ShowtimeSeat.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ShowtimeSeat]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ShowtimeSeat>> delete(
    _i1.DatabaseSession session,
    List<ShowtimeSeat> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ShowtimeSeat>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ShowtimeSeat].
  Future<ShowtimeSeat> deleteRow(
    _i1.DatabaseSession session,
    ShowtimeSeat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ShowtimeSeat>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ShowtimeSeat>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ShowtimeSeatTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ShowtimeSeat>(
      where: where(ShowtimeSeat.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ShowtimeSeatTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ShowtimeSeat>(
      where: where?.call(ShowtimeSeat.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ShowtimeSeat] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ShowtimeSeatTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ShowtimeSeat>(
      where: where(ShowtimeSeat.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
