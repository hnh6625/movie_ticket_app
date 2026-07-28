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
import '../cinemas/room.dart' as _i2;
import 'package:movie_ticket_app_server/src/generated/protocol.dart' as _i3;

abstract class Cinema implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Cinema._({
    this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.rooms,
  });

  factory Cinema({
    int? id,
    required String name,
    required String address,
    required double latitude,
    required double longitude,
    List<_i2.Room>? rooms,
  }) = _CinemaImpl;

  factory Cinema.fromJson(Map<String, dynamic> jsonSerialization) {
    return Cinema(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      address: jsonSerialization['address'] as String,
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
      rooms: jsonSerialization['rooms'] == null
          ? null
          : _i3.Protocol().deserialize<List<_i2.Room>>(
              jsonSerialization['rooms'],
            ),
    );
  }

  static final t = CinemaTable();

  static const db = CinemaRepository._();

  @override
  int? id;

  String name;

  String address;

  double latitude;

  double longitude;

  List<_i2.Room>? rooms;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Cinema]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Cinema copyWith({
    int? id,
    String? name,
    String? address,
    double? latitude,
    double? longitude,
    List<_i2.Room>? rooms,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Cinema',
      if (id != null) 'id': id,
      'name': name,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      if (rooms != null) 'rooms': rooms?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Cinema',
      if (id != null) 'id': id,
      'name': name,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      if (rooms != null)
        'rooms': rooms?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static CinemaInclude include({_i2.RoomIncludeList? rooms}) {
    return CinemaInclude._(rooms: rooms);
  }

  static CinemaIncludeList includeList({
    _i1.WhereExpressionBuilder<CinemaTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CinemaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CinemaTable>? orderByList,
    CinemaInclude? include,
  }) {
    return CinemaIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Cinema.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Cinema.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CinemaImpl extends Cinema {
  _CinemaImpl({
    int? id,
    required String name,
    required String address,
    required double latitude,
    required double longitude,
    List<_i2.Room>? rooms,
  }) : super._(
         id: id,
         name: name,
         address: address,
         latitude: latitude,
         longitude: longitude,
         rooms: rooms,
       );

  /// Returns a shallow copy of this [Cinema]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Cinema copyWith({
    Object? id = _Undefined,
    String? name,
    String? address,
    double? latitude,
    double? longitude,
    Object? rooms = _Undefined,
  }) {
    return Cinema(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      rooms: rooms is List<_i2.Room>?
          ? rooms
          : this.rooms?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class CinemaUpdateTable extends _i1.UpdateTable<CinemaTable> {
  CinemaUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> address(String value) => _i1.ColumnValue(
    table.address,
    value,
  );

  _i1.ColumnValue<double, double> latitude(double value) => _i1.ColumnValue(
    table.latitude,
    value,
  );

  _i1.ColumnValue<double, double> longitude(double value) => _i1.ColumnValue(
    table.longitude,
    value,
  );
}

class CinemaTable extends _i1.Table<int?> {
  CinemaTable({super.tableRelation}) : super(tableName: 'cinemas') {
    updateTable = CinemaUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    address = _i1.ColumnString(
      'address',
      this,
    );
    latitude = _i1.ColumnDouble(
      'latitude',
      this,
    );
    longitude = _i1.ColumnDouble(
      'longitude',
      this,
    );
  }

  late final CinemaUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString address;

  late final _i1.ColumnDouble latitude;

  late final _i1.ColumnDouble longitude;

  _i2.RoomTable? ___rooms;

  _i1.ManyRelation<_i2.RoomTable>? _rooms;

  _i2.RoomTable get __rooms {
    if (___rooms != null) return ___rooms!;
    ___rooms = _i1.createRelationTable(
      relationFieldName: '__rooms',
      field: Cinema.t.id,
      foreignField: _i2.Room.t.cinemaId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.RoomTable(tableRelation: foreignTableRelation),
    );
    return ___rooms!;
  }

  _i1.ManyRelation<_i2.RoomTable> get rooms {
    if (_rooms != null) return _rooms!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'rooms',
      field: Cinema.t.id,
      foreignField: _i2.Room.t.cinemaId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.RoomTable(tableRelation: foreignTableRelation),
    );
    _rooms = _i1.ManyRelation<_i2.RoomTable>(
      tableWithRelations: relationTable,
      table: _i2.RoomTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _rooms!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    address,
    latitude,
    longitude,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'rooms') {
      return __rooms;
    }
    return null;
  }
}

class CinemaInclude extends _i1.IncludeObject {
  CinemaInclude._({_i2.RoomIncludeList? rooms}) {
    _rooms = rooms;
  }

  _i2.RoomIncludeList? _rooms;

  @override
  Map<String, _i1.Include?> get includes => {'rooms': _rooms};

  @override
  _i1.Table<int?> get table => Cinema.t;
}

class CinemaIncludeList extends _i1.IncludeList {
  CinemaIncludeList._({
    _i1.WhereExpressionBuilder<CinemaTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Cinema.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Cinema.t;
}

class CinemaRepository {
  const CinemaRepository._();

  final attach = const CinemaAttachRepository._();

  final attachRow = const CinemaAttachRowRepository._();

  /// Returns a list of [Cinema]s matching the given query parameters.
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
  Future<List<Cinema>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<CinemaTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CinemaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CinemaTable>? orderByList,
    _i1.Transaction? transaction,
    CinemaInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Cinema>(
      where: where?.call(Cinema.t),
      orderBy: orderBy?.call(Cinema.t),
      orderByList: orderByList?.call(Cinema.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Cinema] matching the given query parameters.
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
  Future<Cinema?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<CinemaTable>? where,
    int? offset,
    _i1.OrderByBuilder<CinemaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CinemaTable>? orderByList,
    _i1.Transaction? transaction,
    CinemaInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Cinema>(
      where: where?.call(Cinema.t),
      orderBy: orderBy?.call(Cinema.t),
      orderByList: orderByList?.call(Cinema.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Cinema] by its [id] or null if no such row exists.
  Future<Cinema?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    CinemaInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Cinema>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Cinema]s in the list and returns the inserted rows.
  ///
  /// The returned [Cinema]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Cinema>> insert(
    _i1.DatabaseSession session,
    List<Cinema> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Cinema>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Cinema] and returns the inserted row.
  ///
  /// The returned [Cinema] will have its `id` field set.
  Future<Cinema> insertRow(
    _i1.DatabaseSession session,
    Cinema row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Cinema>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Cinema]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Cinema>> update(
    _i1.DatabaseSession session,
    List<Cinema> rows, {
    _i1.ColumnSelections<CinemaTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Cinema>(
      rows,
      columns: columns?.call(Cinema.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Cinema]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Cinema> updateRow(
    _i1.DatabaseSession session,
    Cinema row, {
    _i1.ColumnSelections<CinemaTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Cinema>(
      row,
      columns: columns?.call(Cinema.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Cinema] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Cinema?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<CinemaUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Cinema>(
      id,
      columnValues: columnValues(Cinema.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Cinema]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Cinema>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<CinemaUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<CinemaTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CinemaTable>? orderBy,
    _i1.OrderByListBuilder<CinemaTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Cinema>(
      columnValues: columnValues(Cinema.t.updateTable),
      where: where(Cinema.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Cinema.t),
      orderByList: orderByList?.call(Cinema.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Cinema]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Cinema>> delete(
    _i1.DatabaseSession session,
    List<Cinema> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Cinema>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Cinema].
  Future<Cinema> deleteRow(
    _i1.DatabaseSession session,
    Cinema row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Cinema>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Cinema>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<CinemaTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Cinema>(
      where: where(Cinema.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<CinemaTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Cinema>(
      where: where?.call(Cinema.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Cinema] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<CinemaTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Cinema>(
      where: where(Cinema.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class CinemaAttachRepository {
  const CinemaAttachRepository._();

  /// Creates a relation between this [Cinema] and the given [Room]s
  /// by setting each [Room]'s foreign key `cinemaId` to refer to this [Cinema].
  Future<void> rooms(
    _i1.DatabaseSession session,
    Cinema cinema,
    List<_i2.Room> room, {
    _i1.Transaction? transaction,
  }) async {
    if (room.any((e) => e.id == null)) {
      throw ArgumentError.notNull('room.id');
    }
    if (cinema.id == null) {
      throw ArgumentError.notNull('cinema.id');
    }

    var $room = room.map((e) => e.copyWith(cinemaId: cinema.id)).toList();
    await session.db.update<_i2.Room>(
      $room,
      columns: [_i2.Room.t.cinemaId],
      transaction: transaction,
    );
  }
}

class CinemaAttachRowRepository {
  const CinemaAttachRowRepository._();

  /// Creates a relation between this [Cinema] and the given [Room]
  /// by setting the [Room]'s foreign key `cinemaId` to refer to this [Cinema].
  Future<void> rooms(
    _i1.DatabaseSession session,
    Cinema cinema,
    _i2.Room room, {
    _i1.Transaction? transaction,
  }) async {
    if (room.id == null) {
      throw ArgumentError.notNull('room.id');
    }
    if (cinema.id == null) {
      throw ArgumentError.notNull('cinema.id');
    }

    var $room = room.copyWith(cinemaId: cinema.id);
    await session.db.updateRow<_i2.Room>(
      $room,
      columns: [_i2.Room.t.cinemaId],
      transaction: transaction,
    );
  }
}
