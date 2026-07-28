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
import 'package:movie_ticket_app_server/src/generated/protocol.dart' as _i3;

abstract class Seat implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Seat._({
    this.id,
    required this.roomId,
    required this.rowLabel,
    required this.seatNumber,
    required this.seatType,
    this.showtimeSeats,
  });

  factory Seat({
    int? id,
    required int roomId,
    required String rowLabel,
    required int seatNumber,
    required String seatType,
    List<_i2.ShowtimeSeat>? showtimeSeats,
  }) = _SeatImpl;

  factory Seat.fromJson(Map<String, dynamic> jsonSerialization) {
    return Seat(
      id: jsonSerialization['id'] as int?,
      roomId: jsonSerialization['roomId'] as int,
      rowLabel: jsonSerialization['rowLabel'] as String,
      seatNumber: jsonSerialization['seatNumber'] as int,
      seatType: jsonSerialization['seatType'] as String,
      showtimeSeats: jsonSerialization['showtimeSeats'] == null
          ? null
          : _i3.Protocol().deserialize<List<_i2.ShowtimeSeat>>(
              jsonSerialization['showtimeSeats'],
            ),
    );
  }

  static final t = SeatTable();

  static const db = SeatRepository._();

  @override
  int? id;

  int roomId;

  String rowLabel;

  int seatNumber;

  String seatType;

  List<_i2.ShowtimeSeat>? showtimeSeats;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Seat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Seat copyWith({
    int? id,
    int? roomId,
    String? rowLabel,
    int? seatNumber,
    String? seatType,
    List<_i2.ShowtimeSeat>? showtimeSeats,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Seat',
      if (id != null) 'id': id,
      'roomId': roomId,
      'rowLabel': rowLabel,
      'seatNumber': seatNumber,
      'seatType': seatType,
      if (showtimeSeats != null)
        'showtimeSeats': showtimeSeats?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Seat',
      if (id != null) 'id': id,
      'roomId': roomId,
      'rowLabel': rowLabel,
      'seatNumber': seatNumber,
      'seatType': seatType,
      if (showtimeSeats != null)
        'showtimeSeats': showtimeSeats?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static SeatInclude include({_i2.ShowtimeSeatIncludeList? showtimeSeats}) {
    return SeatInclude._(showtimeSeats: showtimeSeats);
  }

  static SeatIncludeList includeList({
    _i1.WhereExpressionBuilder<SeatTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SeatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SeatTable>? orderByList,
    SeatInclude? include,
  }) {
    return SeatIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Seat.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Seat.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SeatImpl extends Seat {
  _SeatImpl({
    int? id,
    required int roomId,
    required String rowLabel,
    required int seatNumber,
    required String seatType,
    List<_i2.ShowtimeSeat>? showtimeSeats,
  }) : super._(
         id: id,
         roomId: roomId,
         rowLabel: rowLabel,
         seatNumber: seatNumber,
         seatType: seatType,
         showtimeSeats: showtimeSeats,
       );

  /// Returns a shallow copy of this [Seat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Seat copyWith({
    Object? id = _Undefined,
    int? roomId,
    String? rowLabel,
    int? seatNumber,
    String? seatType,
    Object? showtimeSeats = _Undefined,
  }) {
    return Seat(
      id: id is int? ? id : this.id,
      roomId: roomId ?? this.roomId,
      rowLabel: rowLabel ?? this.rowLabel,
      seatNumber: seatNumber ?? this.seatNumber,
      seatType: seatType ?? this.seatType,
      showtimeSeats: showtimeSeats is List<_i2.ShowtimeSeat>?
          ? showtimeSeats
          : this.showtimeSeats?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class SeatUpdateTable extends _i1.UpdateTable<SeatTable> {
  SeatUpdateTable(super.table);

  _i1.ColumnValue<int, int> roomId(int value) => _i1.ColumnValue(
    table.roomId,
    value,
  );

  _i1.ColumnValue<String, String> rowLabel(String value) => _i1.ColumnValue(
    table.rowLabel,
    value,
  );

  _i1.ColumnValue<int, int> seatNumber(int value) => _i1.ColumnValue(
    table.seatNumber,
    value,
  );

  _i1.ColumnValue<String, String> seatType(String value) => _i1.ColumnValue(
    table.seatType,
    value,
  );
}

class SeatTable extends _i1.Table<int?> {
  SeatTable({super.tableRelation}) : super(tableName: 'seats') {
    updateTable = SeatUpdateTable(this);
    roomId = _i1.ColumnInt(
      'roomId',
      this,
    );
    rowLabel = _i1.ColumnString(
      'rowLabel',
      this,
    );
    seatNumber = _i1.ColumnInt(
      'seatNumber',
      this,
    );
    seatType = _i1.ColumnString(
      'seatType',
      this,
    );
  }

  late final SeatUpdateTable updateTable;

  late final _i1.ColumnInt roomId;

  late final _i1.ColumnString rowLabel;

  late final _i1.ColumnInt seatNumber;

  late final _i1.ColumnString seatType;

  _i2.ShowtimeSeatTable? ___showtimeSeats;

  _i1.ManyRelation<_i2.ShowtimeSeatTable>? _showtimeSeats;

  _i2.ShowtimeSeatTable get __showtimeSeats {
    if (___showtimeSeats != null) return ___showtimeSeats!;
    ___showtimeSeats = _i1.createRelationTable(
      relationFieldName: '__showtimeSeats',
      field: Seat.t.id,
      foreignField: _i2.ShowtimeSeat.t.seatId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ShowtimeSeatTable(tableRelation: foreignTableRelation),
    );
    return ___showtimeSeats!;
  }

  _i1.ManyRelation<_i2.ShowtimeSeatTable> get showtimeSeats {
    if (_showtimeSeats != null) return _showtimeSeats!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'showtimeSeats',
      field: Seat.t.id,
      foreignField: _i2.ShowtimeSeat.t.seatId,
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

  @override
  List<_i1.Column> get columns => [
    id,
    roomId,
    rowLabel,
    seatNumber,
    seatType,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'showtimeSeats') {
      return __showtimeSeats;
    }
    return null;
  }
}

class SeatInclude extends _i1.IncludeObject {
  SeatInclude._({_i2.ShowtimeSeatIncludeList? showtimeSeats}) {
    _showtimeSeats = showtimeSeats;
  }

  _i2.ShowtimeSeatIncludeList? _showtimeSeats;

  @override
  Map<String, _i1.Include?> get includes => {'showtimeSeats': _showtimeSeats};

  @override
  _i1.Table<int?> get table => Seat.t;
}

class SeatIncludeList extends _i1.IncludeList {
  SeatIncludeList._({
    _i1.WhereExpressionBuilder<SeatTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Seat.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Seat.t;
}

class SeatRepository {
  const SeatRepository._();

  final attach = const SeatAttachRepository._();

  final attachRow = const SeatAttachRowRepository._();

  /// Returns a list of [Seat]s matching the given query parameters.
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
  Future<List<Seat>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SeatTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SeatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SeatTable>? orderByList,
    _i1.Transaction? transaction,
    SeatInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Seat>(
      where: where?.call(Seat.t),
      orderBy: orderBy?.call(Seat.t),
      orderByList: orderByList?.call(Seat.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Seat] matching the given query parameters.
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
  Future<Seat?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SeatTable>? where,
    int? offset,
    _i1.OrderByBuilder<SeatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SeatTable>? orderByList,
    _i1.Transaction? transaction,
    SeatInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Seat>(
      where: where?.call(Seat.t),
      orderBy: orderBy?.call(Seat.t),
      orderByList: orderByList?.call(Seat.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Seat] by its [id] or null if no such row exists.
  Future<Seat?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    SeatInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Seat>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Seat]s in the list and returns the inserted rows.
  ///
  /// The returned [Seat]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Seat>> insert(
    _i1.DatabaseSession session,
    List<Seat> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Seat>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Seat] and returns the inserted row.
  ///
  /// The returned [Seat] will have its `id` field set.
  Future<Seat> insertRow(
    _i1.DatabaseSession session,
    Seat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Seat>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Seat]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Seat>> update(
    _i1.DatabaseSession session,
    List<Seat> rows, {
    _i1.ColumnSelections<SeatTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Seat>(
      rows,
      columns: columns?.call(Seat.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Seat]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Seat> updateRow(
    _i1.DatabaseSession session,
    Seat row, {
    _i1.ColumnSelections<SeatTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Seat>(
      row,
      columns: columns?.call(Seat.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Seat] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Seat?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<SeatUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Seat>(
      id,
      columnValues: columnValues(Seat.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Seat]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Seat>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<SeatUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<SeatTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SeatTable>? orderBy,
    _i1.OrderByListBuilder<SeatTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Seat>(
      columnValues: columnValues(Seat.t.updateTable),
      where: where(Seat.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Seat.t),
      orderByList: orderByList?.call(Seat.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Seat]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Seat>> delete(
    _i1.DatabaseSession session,
    List<Seat> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Seat>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Seat].
  Future<Seat> deleteRow(
    _i1.DatabaseSession session,
    Seat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Seat>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Seat>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<SeatTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Seat>(
      where: where(Seat.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SeatTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Seat>(
      where: where?.call(Seat.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Seat] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<SeatTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Seat>(
      where: where(Seat.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class SeatAttachRepository {
  const SeatAttachRepository._();

  /// Creates a relation between this [Seat] and the given [ShowtimeSeat]s
  /// by setting each [ShowtimeSeat]'s foreign key `seatId` to refer to this [Seat].
  Future<void> showtimeSeats(
    _i1.DatabaseSession session,
    Seat seat,
    List<_i2.ShowtimeSeat> showtimeSeat, {
    _i1.Transaction? transaction,
  }) async {
    if (showtimeSeat.any((e) => e.id == null)) {
      throw ArgumentError.notNull('showtimeSeat.id');
    }
    if (seat.id == null) {
      throw ArgumentError.notNull('seat.id');
    }

    var $showtimeSeat = showtimeSeat
        .map((e) => e.copyWith(seatId: seat.id))
        .toList();
    await session.db.update<_i2.ShowtimeSeat>(
      $showtimeSeat,
      columns: [_i2.ShowtimeSeat.t.seatId],
      transaction: transaction,
    );
  }
}

class SeatAttachRowRepository {
  const SeatAttachRowRepository._();

  /// Creates a relation between this [Seat] and the given [ShowtimeSeat]
  /// by setting the [ShowtimeSeat]'s foreign key `seatId` to refer to this [Seat].
  Future<void> showtimeSeats(
    _i1.DatabaseSession session,
    Seat seat,
    _i2.ShowtimeSeat showtimeSeat, {
    _i1.Transaction? transaction,
  }) async {
    if (showtimeSeat.id == null) {
      throw ArgumentError.notNull('showtimeSeat.id');
    }
    if (seat.id == null) {
      throw ArgumentError.notNull('seat.id');
    }

    var $showtimeSeat = showtimeSeat.copyWith(seatId: seat.id);
    await session.db.updateRow<_i2.ShowtimeSeat>(
      $showtimeSeat,
      columns: [_i2.ShowtimeSeat.t.seatId],
      transaction: transaction,
    );
  }
}
