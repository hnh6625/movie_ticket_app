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
import '../cinemas/seat.dart' as _i2;
import '../showtimes/showtime.dart' as _i3;
import 'package:movie_ticket_app_server/src/generated/protocol.dart' as _i4;

abstract class Room implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Room._({
    this.id,
    required this.cinemaId,
    required this.name,
    required this.roomType,
    this.seats,
    this.showtimes,
  });

  factory Room({
    int? id,
    required int cinemaId,
    required String name,
    required String roomType,
    List<_i2.Seat>? seats,
    List<_i3.Showtime>? showtimes,
  }) = _RoomImpl;

  factory Room.fromJson(Map<String, dynamic> jsonSerialization) {
    return Room(
      id: jsonSerialization['id'] as int?,
      cinemaId: jsonSerialization['cinemaId'] as int,
      name: jsonSerialization['name'] as String,
      roomType: jsonSerialization['roomType'] as String,
      seats: jsonSerialization['seats'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i2.Seat>>(
              jsonSerialization['seats'],
            ),
      showtimes: jsonSerialization['showtimes'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.Showtime>>(
              jsonSerialization['showtimes'],
            ),
    );
  }

  static final t = RoomTable();

  static const db = RoomRepository._();

  @override
  int? id;

  int cinemaId;

  String name;

  String roomType;

  List<_i2.Seat>? seats;

  List<_i3.Showtime>? showtimes;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Room]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Room copyWith({
    int? id,
    int? cinemaId,
    String? name,
    String? roomType,
    List<_i2.Seat>? seats,
    List<_i3.Showtime>? showtimes,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Room',
      if (id != null) 'id': id,
      'cinemaId': cinemaId,
      'name': name,
      'roomType': roomType,
      if (seats != null) 'seats': seats?.toJson(valueToJson: (v) => v.toJson()),
      if (showtimes != null)
        'showtimes': showtimes?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Room',
      if (id != null) 'id': id,
      'cinemaId': cinemaId,
      'name': name,
      'roomType': roomType,
      if (seats != null)
        'seats': seats?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (showtimes != null)
        'showtimes': showtimes?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static RoomInclude include({
    _i2.SeatIncludeList? seats,
    _i3.ShowtimeIncludeList? showtimes,
  }) {
    return RoomInclude._(
      seats: seats,
      showtimes: showtimes,
    );
  }

  static RoomIncludeList includeList({
    _i1.WhereExpressionBuilder<RoomTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RoomTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoomTable>? orderByList,
    RoomInclude? include,
  }) {
    return RoomIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Room.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Room.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RoomImpl extends Room {
  _RoomImpl({
    int? id,
    required int cinemaId,
    required String name,
    required String roomType,
    List<_i2.Seat>? seats,
    List<_i3.Showtime>? showtimes,
  }) : super._(
         id: id,
         cinemaId: cinemaId,
         name: name,
         roomType: roomType,
         seats: seats,
         showtimes: showtimes,
       );

  /// Returns a shallow copy of this [Room]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Room copyWith({
    Object? id = _Undefined,
    int? cinemaId,
    String? name,
    String? roomType,
    Object? seats = _Undefined,
    Object? showtimes = _Undefined,
  }) {
    return Room(
      id: id is int? ? id : this.id,
      cinemaId: cinemaId ?? this.cinemaId,
      name: name ?? this.name,
      roomType: roomType ?? this.roomType,
      seats: seats is List<_i2.Seat>?
          ? seats
          : this.seats?.map((e0) => e0.copyWith()).toList(),
      showtimes: showtimes is List<_i3.Showtime>?
          ? showtimes
          : this.showtimes?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class RoomUpdateTable extends _i1.UpdateTable<RoomTable> {
  RoomUpdateTable(super.table);

  _i1.ColumnValue<int, int> cinemaId(int value) => _i1.ColumnValue(
    table.cinemaId,
    value,
  );

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> roomType(String value) => _i1.ColumnValue(
    table.roomType,
    value,
  );
}

class RoomTable extends _i1.Table<int?> {
  RoomTable({super.tableRelation}) : super(tableName: 'rooms') {
    updateTable = RoomUpdateTable(this);
    cinemaId = _i1.ColumnInt(
      'cinemaId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    roomType = _i1.ColumnString(
      'roomType',
      this,
    );
  }

  late final RoomUpdateTable updateTable;

  late final _i1.ColumnInt cinemaId;

  late final _i1.ColumnString name;

  late final _i1.ColumnString roomType;

  _i2.SeatTable? ___seats;

  _i1.ManyRelation<_i2.SeatTable>? _seats;

  _i3.ShowtimeTable? ___showtimes;

  _i1.ManyRelation<_i3.ShowtimeTable>? _showtimes;

  _i2.SeatTable get __seats {
    if (___seats != null) return ___seats!;
    ___seats = _i1.createRelationTable(
      relationFieldName: '__seats',
      field: Room.t.id,
      foreignField: _i2.Seat.t.roomId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.SeatTable(tableRelation: foreignTableRelation),
    );
    return ___seats!;
  }

  _i3.ShowtimeTable get __showtimes {
    if (___showtimes != null) return ___showtimes!;
    ___showtimes = _i1.createRelationTable(
      relationFieldName: '__showtimes',
      field: Room.t.id,
      foreignField: _i3.Showtime.t.roomId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ShowtimeTable(tableRelation: foreignTableRelation),
    );
    return ___showtimes!;
  }

  _i1.ManyRelation<_i2.SeatTable> get seats {
    if (_seats != null) return _seats!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'seats',
      field: Room.t.id,
      foreignField: _i2.Seat.t.roomId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.SeatTable(tableRelation: foreignTableRelation),
    );
    _seats = _i1.ManyRelation<_i2.SeatTable>(
      tableWithRelations: relationTable,
      table: _i2.SeatTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _seats!;
  }

  _i1.ManyRelation<_i3.ShowtimeTable> get showtimes {
    if (_showtimes != null) return _showtimes!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'showtimes',
      field: Room.t.id,
      foreignField: _i3.Showtime.t.roomId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ShowtimeTable(tableRelation: foreignTableRelation),
    );
    _showtimes = _i1.ManyRelation<_i3.ShowtimeTable>(
      tableWithRelations: relationTable,
      table: _i3.ShowtimeTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _showtimes!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    cinemaId,
    name,
    roomType,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'seats') {
      return __seats;
    }
    if (relationField == 'showtimes') {
      return __showtimes;
    }
    return null;
  }
}

class RoomInclude extends _i1.IncludeObject {
  RoomInclude._({
    _i2.SeatIncludeList? seats,
    _i3.ShowtimeIncludeList? showtimes,
  }) {
    _seats = seats;
    _showtimes = showtimes;
  }

  _i2.SeatIncludeList? _seats;

  _i3.ShowtimeIncludeList? _showtimes;

  @override
  Map<String, _i1.Include?> get includes => {
    'seats': _seats,
    'showtimes': _showtimes,
  };

  @override
  _i1.Table<int?> get table => Room.t;
}

class RoomIncludeList extends _i1.IncludeList {
  RoomIncludeList._({
    _i1.WhereExpressionBuilder<RoomTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Room.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Room.t;
}

class RoomRepository {
  const RoomRepository._();

  final attach = const RoomAttachRepository._();

  final attachRow = const RoomAttachRowRepository._();

  /// Returns a list of [Room]s matching the given query parameters.
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
  Future<List<Room>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RoomTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RoomTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoomTable>? orderByList,
    _i1.Transaction? transaction,
    RoomInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Room>(
      where: where?.call(Room.t),
      orderBy: orderBy?.call(Room.t),
      orderByList: orderByList?.call(Room.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Room] matching the given query parameters.
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
  Future<Room?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RoomTable>? where,
    int? offset,
    _i1.OrderByBuilder<RoomTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoomTable>? orderByList,
    _i1.Transaction? transaction,
    RoomInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Room>(
      where: where?.call(Room.t),
      orderBy: orderBy?.call(Room.t),
      orderByList: orderByList?.call(Room.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Room] by its [id] or null if no such row exists.
  Future<Room?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    RoomInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Room>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Room]s in the list and returns the inserted rows.
  ///
  /// The returned [Room]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Room>> insert(
    _i1.DatabaseSession session,
    List<Room> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Room>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Room] and returns the inserted row.
  ///
  /// The returned [Room] will have its `id` field set.
  Future<Room> insertRow(
    _i1.DatabaseSession session,
    Room row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Room>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Room]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Room>> update(
    _i1.DatabaseSession session,
    List<Room> rows, {
    _i1.ColumnSelections<RoomTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Room>(
      rows,
      columns: columns?.call(Room.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Room]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Room> updateRow(
    _i1.DatabaseSession session,
    Room row, {
    _i1.ColumnSelections<RoomTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Room>(
      row,
      columns: columns?.call(Room.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Room] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Room?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<RoomUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Room>(
      id,
      columnValues: columnValues(Room.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Room]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Room>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<RoomUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<RoomTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RoomTable>? orderBy,
    _i1.OrderByListBuilder<RoomTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Room>(
      columnValues: columnValues(Room.t.updateTable),
      where: where(Room.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Room.t),
      orderByList: orderByList?.call(Room.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Room]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Room>> delete(
    _i1.DatabaseSession session,
    List<Room> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Room>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Room].
  Future<Room> deleteRow(
    _i1.DatabaseSession session,
    Room row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Room>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Room>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<RoomTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Room>(
      where: where(Room.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RoomTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Room>(
      where: where?.call(Room.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Room] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<RoomTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Room>(
      where: where(Room.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class RoomAttachRepository {
  const RoomAttachRepository._();

  /// Creates a relation between this [Room] and the given [Seat]s
  /// by setting each [Seat]'s foreign key `roomId` to refer to this [Room].
  Future<void> seats(
    _i1.DatabaseSession session,
    Room room,
    List<_i2.Seat> seat, {
    _i1.Transaction? transaction,
  }) async {
    if (seat.any((e) => e.id == null)) {
      throw ArgumentError.notNull('seat.id');
    }
    if (room.id == null) {
      throw ArgumentError.notNull('room.id');
    }

    var $seat = seat.map((e) => e.copyWith(roomId: room.id)).toList();
    await session.db.update<_i2.Seat>(
      $seat,
      columns: [_i2.Seat.t.roomId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Room] and the given [Showtime]s
  /// by setting each [Showtime]'s foreign key `roomId` to refer to this [Room].
  Future<void> showtimes(
    _i1.DatabaseSession session,
    Room room,
    List<_i3.Showtime> showtime, {
    _i1.Transaction? transaction,
  }) async {
    if (showtime.any((e) => e.id == null)) {
      throw ArgumentError.notNull('showtime.id');
    }
    if (room.id == null) {
      throw ArgumentError.notNull('room.id');
    }

    var $showtime = showtime.map((e) => e.copyWith(roomId: room.id)).toList();
    await session.db.update<_i3.Showtime>(
      $showtime,
      columns: [_i3.Showtime.t.roomId],
      transaction: transaction,
    );
  }
}

class RoomAttachRowRepository {
  const RoomAttachRowRepository._();

  /// Creates a relation between this [Room] and the given [Seat]
  /// by setting the [Seat]'s foreign key `roomId` to refer to this [Room].
  Future<void> seats(
    _i1.DatabaseSession session,
    Room room,
    _i2.Seat seat, {
    _i1.Transaction? transaction,
  }) async {
    if (seat.id == null) {
      throw ArgumentError.notNull('seat.id');
    }
    if (room.id == null) {
      throw ArgumentError.notNull('room.id');
    }

    var $seat = seat.copyWith(roomId: room.id);
    await session.db.updateRow<_i2.Seat>(
      $seat,
      columns: [_i2.Seat.t.roomId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Room] and the given [Showtime]
  /// by setting the [Showtime]'s foreign key `roomId` to refer to this [Room].
  Future<void> showtimes(
    _i1.DatabaseSession session,
    Room room,
    _i3.Showtime showtime, {
    _i1.Transaction? transaction,
  }) async {
    if (showtime.id == null) {
      throw ArgumentError.notNull('showtime.id');
    }
    if (room.id == null) {
      throw ArgumentError.notNull('room.id');
    }

    var $showtime = showtime.copyWith(roomId: room.id);
    await session.db.updateRow<_i3.Showtime>(
      $showtime,
      columns: [_i3.Showtime.t.roomId],
      transaction: transaction,
    );
  }
}
