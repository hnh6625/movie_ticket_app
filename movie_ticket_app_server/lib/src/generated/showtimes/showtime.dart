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
import '../showtimes/showtime_seat.dart' as _i2;
import '../orders/order.dart' as _i3;
import 'package:movie_ticket_app_server/src/generated/protocol.dart' as _i4;

abstract class Showtime
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Showtime._({
    this.id,
    required this.movieId,
    required this.roomId,
    required this.startTime,
    required this.basePrice,
    this.showtimeSeats,
    this.orders,
  });

  factory Showtime({
    int? id,
    required int movieId,
    required int roomId,
    required DateTime startTime,
    required double basePrice,
    List<_i2.ShowtimeSeat>? showtimeSeats,
    List<_i3.Order>? orders,
  }) = _ShowtimeImpl;

  factory Showtime.fromJson(Map<String, dynamic> jsonSerialization) {
    return Showtime(
      id: jsonSerialization['id'] as int?,
      movieId: jsonSerialization['movieId'] as int,
      roomId: jsonSerialization['roomId'] as int,
      startTime: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['startTime'],
      ),
      basePrice: (jsonSerialization['basePrice'] as num).toDouble(),
      showtimeSeats: jsonSerialization['showtimeSeats'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i2.ShowtimeSeat>>(
              jsonSerialization['showtimeSeats'],
            ),
      orders: jsonSerialization['orders'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.Order>>(
              jsonSerialization['orders'],
            ),
    );
  }

  static final t = ShowtimeTable();

  static const db = ShowtimeRepository._();

  @override
  int? id;

  int movieId;

  int roomId;

  DateTime startTime;

  double basePrice;

  List<_i2.ShowtimeSeat>? showtimeSeats;

  List<_i3.Order>? orders;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Showtime]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Showtime copyWith({
    int? id,
    int? movieId,
    int? roomId,
    DateTime? startTime,
    double? basePrice,
    List<_i2.ShowtimeSeat>? showtimeSeats,
    List<_i3.Order>? orders,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Showtime',
      if (id != null) 'id': id,
      'movieId': movieId,
      'roomId': roomId,
      'startTime': startTime.toJson(),
      'basePrice': basePrice,
      if (showtimeSeats != null)
        'showtimeSeats': showtimeSeats?.toJson(valueToJson: (v) => v.toJson()),
      if (orders != null)
        'orders': orders?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Showtime',
      if (id != null) 'id': id,
      'movieId': movieId,
      'roomId': roomId,
      'startTime': startTime.toJson(),
      'basePrice': basePrice,
      if (showtimeSeats != null)
        'showtimeSeats': showtimeSeats?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (orders != null)
        'orders': orders?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static ShowtimeInclude include({
    _i2.ShowtimeSeatIncludeList? showtimeSeats,
    _i3.OrderIncludeList? orders,
  }) {
    return ShowtimeInclude._(
      showtimeSeats: showtimeSeats,
      orders: orders,
    );
  }

  static ShowtimeIncludeList includeList({
    _i1.WhereExpressionBuilder<ShowtimeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ShowtimeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ShowtimeTable>? orderByList,
    ShowtimeInclude? include,
  }) {
    return ShowtimeIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Showtime.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Showtime.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ShowtimeImpl extends Showtime {
  _ShowtimeImpl({
    int? id,
    required int movieId,
    required int roomId,
    required DateTime startTime,
    required double basePrice,
    List<_i2.ShowtimeSeat>? showtimeSeats,
    List<_i3.Order>? orders,
  }) : super._(
         id: id,
         movieId: movieId,
         roomId: roomId,
         startTime: startTime,
         basePrice: basePrice,
         showtimeSeats: showtimeSeats,
         orders: orders,
       );

  /// Returns a shallow copy of this [Showtime]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Showtime copyWith({
    Object? id = _Undefined,
    int? movieId,
    int? roomId,
    DateTime? startTime,
    double? basePrice,
    Object? showtimeSeats = _Undefined,
    Object? orders = _Undefined,
  }) {
    return Showtime(
      id: id is int? ? id : this.id,
      movieId: movieId ?? this.movieId,
      roomId: roomId ?? this.roomId,
      startTime: startTime ?? this.startTime,
      basePrice: basePrice ?? this.basePrice,
      showtimeSeats: showtimeSeats is List<_i2.ShowtimeSeat>?
          ? showtimeSeats
          : this.showtimeSeats?.map((e0) => e0.copyWith()).toList(),
      orders: orders is List<_i3.Order>?
          ? orders
          : this.orders?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class ShowtimeUpdateTable extends _i1.UpdateTable<ShowtimeTable> {
  ShowtimeUpdateTable(super.table);

  _i1.ColumnValue<int, int> movieId(int value) => _i1.ColumnValue(
    table.movieId,
    value,
  );

  _i1.ColumnValue<int, int> roomId(int value) => _i1.ColumnValue(
    table.roomId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> startTime(DateTime value) =>
      _i1.ColumnValue(
        table.startTime,
        value,
      );

  _i1.ColumnValue<double, double> basePrice(double value) => _i1.ColumnValue(
    table.basePrice,
    value,
  );
}

class ShowtimeTable extends _i1.Table<int?> {
  ShowtimeTable({super.tableRelation}) : super(tableName: 'showtimes') {
    updateTable = ShowtimeUpdateTable(this);
    movieId = _i1.ColumnInt(
      'movieId',
      this,
    );
    roomId = _i1.ColumnInt(
      'roomId',
      this,
    );
    startTime = _i1.ColumnDateTime(
      'startTime',
      this,
    );
    basePrice = _i1.ColumnDouble(
      'basePrice',
      this,
    );
  }

  late final ShowtimeUpdateTable updateTable;

  late final _i1.ColumnInt movieId;

  late final _i1.ColumnInt roomId;

  late final _i1.ColumnDateTime startTime;

  late final _i1.ColumnDouble basePrice;

  _i2.ShowtimeSeatTable? ___showtimeSeats;

  _i1.ManyRelation<_i2.ShowtimeSeatTable>? _showtimeSeats;

  _i3.OrderTable? ___orders;

  _i1.ManyRelation<_i3.OrderTable>? _orders;

  _i2.ShowtimeSeatTable get __showtimeSeats {
    if (___showtimeSeats != null) return ___showtimeSeats!;
    ___showtimeSeats = _i1.createRelationTable(
      relationFieldName: '__showtimeSeats',
      field: Showtime.t.id,
      foreignField: _i2.ShowtimeSeat.t.showtimeId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ShowtimeSeatTable(tableRelation: foreignTableRelation),
    );
    return ___showtimeSeats!;
  }

  _i3.OrderTable get __orders {
    if (___orders != null) return ___orders!;
    ___orders = _i1.createRelationTable(
      relationFieldName: '__orders',
      field: Showtime.t.id,
      foreignField: _i3.Order.t.showtimeId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.OrderTable(tableRelation: foreignTableRelation),
    );
    return ___orders!;
  }

  _i1.ManyRelation<_i2.ShowtimeSeatTable> get showtimeSeats {
    if (_showtimeSeats != null) return _showtimeSeats!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'showtimeSeats',
      field: Showtime.t.id,
      foreignField: _i2.ShowtimeSeat.t.showtimeId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ShowtimeSeatTable(tableRelation: foreignTableRelation),
    );
    _showtimeSeats = _i1.ManyRelation<_i2.ShowtimeSeatTable>(
      tableWithRelations: relationTable,
      table: _i2.ShowtimeSeatTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _showtimeSeats!;
  }

  _i1.ManyRelation<_i3.OrderTable> get orders {
    if (_orders != null) return _orders!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'orders',
      field: Showtime.t.id,
      foreignField: _i3.Order.t.showtimeId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.OrderTable(tableRelation: foreignTableRelation),
    );
    _orders = _i1.ManyRelation<_i3.OrderTable>(
      tableWithRelations: relationTable,
      table: _i3.OrderTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _orders!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    movieId,
    roomId,
    startTime,
    basePrice,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'showtimeSeats') {
      return __showtimeSeats;
    }
    if (relationField == 'orders') {
      return __orders;
    }
    return null;
  }
}

class ShowtimeInclude extends _i1.IncludeObject {
  ShowtimeInclude._({
    _i2.ShowtimeSeatIncludeList? showtimeSeats,
    _i3.OrderIncludeList? orders,
  }) {
    _showtimeSeats = showtimeSeats;
    _orders = orders;
  }

  _i2.ShowtimeSeatIncludeList? _showtimeSeats;

  _i3.OrderIncludeList? _orders;

  @override
  Map<String, _i1.Include?> get includes => {
    'showtimeSeats': _showtimeSeats,
    'orders': _orders,
  };

  @override
  _i1.Table<int?> get table => Showtime.t;
}

class ShowtimeIncludeList extends _i1.IncludeList {
  ShowtimeIncludeList._({
    _i1.WhereExpressionBuilder<ShowtimeTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Showtime.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Showtime.t;
}

class ShowtimeRepository {
  const ShowtimeRepository._();

  final attach = const ShowtimeAttachRepository._();

  final attachRow = const ShowtimeAttachRowRepository._();

  /// Returns a list of [Showtime]s matching the given query parameters.
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
  Future<List<Showtime>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ShowtimeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ShowtimeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ShowtimeTable>? orderByList,
    _i1.Transaction? transaction,
    ShowtimeInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Showtime>(
      where: where?.call(Showtime.t),
      orderBy: orderBy?.call(Showtime.t),
      orderByList: orderByList?.call(Showtime.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Showtime] matching the given query parameters.
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
  Future<Showtime?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ShowtimeTable>? where,
    int? offset,
    _i1.OrderByBuilder<ShowtimeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ShowtimeTable>? orderByList,
    _i1.Transaction? transaction,
    ShowtimeInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Showtime>(
      where: where?.call(Showtime.t),
      orderBy: orderBy?.call(Showtime.t),
      orderByList: orderByList?.call(Showtime.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Showtime] by its [id] or null if no such row exists.
  Future<Showtime?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    ShowtimeInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Showtime>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Showtime]s in the list and returns the inserted rows.
  ///
  /// The returned [Showtime]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Showtime>> insert(
    _i1.DatabaseSession session,
    List<Showtime> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Showtime>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Showtime] and returns the inserted row.
  ///
  /// The returned [Showtime] will have its `id` field set.
  Future<Showtime> insertRow(
    _i1.DatabaseSession session,
    Showtime row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Showtime>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Showtime]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Showtime>> update(
    _i1.DatabaseSession session,
    List<Showtime> rows, {
    _i1.ColumnSelections<ShowtimeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Showtime>(
      rows,
      columns: columns?.call(Showtime.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Showtime]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Showtime> updateRow(
    _i1.DatabaseSession session,
    Showtime row, {
    _i1.ColumnSelections<ShowtimeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Showtime>(
      row,
      columns: columns?.call(Showtime.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Showtime] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Showtime?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<ShowtimeUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Showtime>(
      id,
      columnValues: columnValues(Showtime.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Showtime]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Showtime>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<ShowtimeUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ShowtimeTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ShowtimeTable>? orderBy,
    _i1.OrderByListBuilder<ShowtimeTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Showtime>(
      columnValues: columnValues(Showtime.t.updateTable),
      where: where(Showtime.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Showtime.t),
      orderByList: orderByList?.call(Showtime.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Showtime]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Showtime>> delete(
    _i1.DatabaseSession session,
    List<Showtime> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Showtime>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Showtime].
  Future<Showtime> deleteRow(
    _i1.DatabaseSession session,
    Showtime row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Showtime>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Showtime>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ShowtimeTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Showtime>(
      where: where(Showtime.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ShowtimeTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Showtime>(
      where: where?.call(Showtime.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Showtime] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ShowtimeTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Showtime>(
      where: where(Showtime.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class ShowtimeAttachRepository {
  const ShowtimeAttachRepository._();

  /// Creates a relation between this [Showtime] and the given [ShowtimeSeat]s
  /// by setting each [ShowtimeSeat]'s foreign key `showtimeId` to refer to this [Showtime].
  Future<void> showtimeSeats(
    _i1.DatabaseSession session,
    Showtime showtime,
    List<_i2.ShowtimeSeat> showtimeSeat, {
    _i1.Transaction? transaction,
  }) async {
    if (showtimeSeat.any((e) => e.id == null)) {
      throw ArgumentError.notNull('showtimeSeat.id');
    }
    if (showtime.id == null) {
      throw ArgumentError.notNull('showtime.id');
    }

    var $showtimeSeat = showtimeSeat
        .map((e) => e.copyWith(showtimeId: showtime.id))
        .toList();
    await session.db.update<_i2.ShowtimeSeat>(
      $showtimeSeat,
      columns: [_i2.ShowtimeSeat.t.showtimeId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Showtime] and the given [Order]s
  /// by setting each [Order]'s foreign key `showtimeId` to refer to this [Showtime].
  Future<void> orders(
    _i1.DatabaseSession session,
    Showtime showtime,
    List<_i3.Order> order, {
    _i1.Transaction? transaction,
  }) async {
    if (order.any((e) => e.id == null)) {
      throw ArgumentError.notNull('order.id');
    }
    if (showtime.id == null) {
      throw ArgumentError.notNull('showtime.id');
    }

    var $order = order.map((e) => e.copyWith(showtimeId: showtime.id)).toList();
    await session.db.update<_i3.Order>(
      $order,
      columns: [_i3.Order.t.showtimeId],
      transaction: transaction,
    );
  }
}

class ShowtimeAttachRowRepository {
  const ShowtimeAttachRowRepository._();

  /// Creates a relation between this [Showtime] and the given [ShowtimeSeat]
  /// by setting the [ShowtimeSeat]'s foreign key `showtimeId` to refer to this [Showtime].
  Future<void> showtimeSeats(
    _i1.DatabaseSession session,
    Showtime showtime,
    _i2.ShowtimeSeat showtimeSeat, {
    _i1.Transaction? transaction,
  }) async {
    if (showtimeSeat.id == null) {
      throw ArgumentError.notNull('showtimeSeat.id');
    }
    if (showtime.id == null) {
      throw ArgumentError.notNull('showtime.id');
    }

    var $showtimeSeat = showtimeSeat.copyWith(showtimeId: showtime.id);
    await session.db.updateRow<_i2.ShowtimeSeat>(
      $showtimeSeat,
      columns: [_i2.ShowtimeSeat.t.showtimeId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Showtime] and the given [Order]
  /// by setting the [Order]'s foreign key `showtimeId` to refer to this [Showtime].
  Future<void> orders(
    _i1.DatabaseSession session,
    Showtime showtime,
    _i3.Order order, {
    _i1.Transaction? transaction,
  }) async {
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }
    if (showtime.id == null) {
      throw ArgumentError.notNull('showtime.id');
    }

    var $order = order.copyWith(showtimeId: showtime.id);
    await session.db.updateRow<_i3.Order>(
      $order,
      columns: [_i3.Order.t.showtimeId],
      transaction: transaction,
    );
  }
}
