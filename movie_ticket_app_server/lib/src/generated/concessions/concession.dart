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

abstract class Concession
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Concession._({
    this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  factory Concession({
    int? id,
    required String name,
    required String description,
    required String imageUrl,
    required double price,
  }) = _ConcessionImpl;

  factory Concession.fromJson(Map<String, dynamic> jsonSerialization) {
    return Concession(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      imageUrl: jsonSerialization['imageUrl'] as String,
      price: (jsonSerialization['price'] as num).toDouble(),
    );
  }

  static final t = ConcessionTable();

  static const db = ConcessionRepository._();

  @override
  int? id;

  String name;

  String description;

  String imageUrl;

  double price;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Concession]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Concession copyWith({
    int? id,
    String? name,
    String? description,
    String? imageUrl,
    double? price,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Concession',
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Concession',
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
    };
  }

  static ConcessionInclude include() {
    return ConcessionInclude._();
  }

  static ConcessionIncludeList includeList({
    _i1.WhereExpressionBuilder<ConcessionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ConcessionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ConcessionTable>? orderByList,
    ConcessionInclude? include,
  }) {
    return ConcessionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Concession.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Concession.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ConcessionImpl extends Concession {
  _ConcessionImpl({
    int? id,
    required String name,
    required String description,
    required String imageUrl,
    required double price,
  }) : super._(
         id: id,
         name: name,
         description: description,
         imageUrl: imageUrl,
         price: price,
       );

  /// Returns a shallow copy of this [Concession]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Concession copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    String? imageUrl,
    double? price,
  }) {
    return Concession(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
    );
  }
}

class ConcessionUpdateTable extends _i1.UpdateTable<ConcessionTable> {
  ConcessionUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> description(String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<String, String> imageUrl(String value) => _i1.ColumnValue(
    table.imageUrl,
    value,
  );

  _i1.ColumnValue<double, double> price(double value) => _i1.ColumnValue(
    table.price,
    value,
  );
}

class ConcessionTable extends _i1.Table<int?> {
  ConcessionTable({super.tableRelation}) : super(tableName: 'concessions') {
    updateTable = ConcessionUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    imageUrl = _i1.ColumnString(
      'imageUrl',
      this,
    );
    price = _i1.ColumnDouble(
      'price',
      this,
    );
  }

  late final ConcessionUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnDouble price;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    description,
    imageUrl,
    price,
  ];
}

class ConcessionInclude extends _i1.IncludeObject {
  ConcessionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Concession.t;
}

class ConcessionIncludeList extends _i1.IncludeList {
  ConcessionIncludeList._({
    _i1.WhereExpressionBuilder<ConcessionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Concession.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Concession.t;
}

class ConcessionRepository {
  const ConcessionRepository._();

  /// Returns a list of [Concession]s matching the given query parameters.
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
  Future<List<Concession>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ConcessionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ConcessionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ConcessionTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Concession>(
      where: where?.call(Concession.t),
      orderBy: orderBy?.call(Concession.t),
      orderByList: orderByList?.call(Concession.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Concession] matching the given query parameters.
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
  Future<Concession?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ConcessionTable>? where,
    int? offset,
    _i1.OrderByBuilder<ConcessionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ConcessionTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Concession>(
      where: where?.call(Concession.t),
      orderBy: orderBy?.call(Concession.t),
      orderByList: orderByList?.call(Concession.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Concession] by its [id] or null if no such row exists.
  Future<Concession?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Concession>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Concession]s in the list and returns the inserted rows.
  ///
  /// The returned [Concession]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Concession>> insert(
    _i1.DatabaseSession session,
    List<Concession> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Concession>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Concession] and returns the inserted row.
  ///
  /// The returned [Concession] will have its `id` field set.
  Future<Concession> insertRow(
    _i1.DatabaseSession session,
    Concession row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Concession>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Concession]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Concession>> update(
    _i1.DatabaseSession session,
    List<Concession> rows, {
    _i1.ColumnSelections<ConcessionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Concession>(
      rows,
      columns: columns?.call(Concession.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Concession]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Concession> updateRow(
    _i1.DatabaseSession session,
    Concession row, {
    _i1.ColumnSelections<ConcessionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Concession>(
      row,
      columns: columns?.call(Concession.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Concession] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Concession?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<ConcessionUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Concession>(
      id,
      columnValues: columnValues(Concession.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Concession]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Concession>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<ConcessionUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ConcessionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ConcessionTable>? orderBy,
    _i1.OrderByListBuilder<ConcessionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Concession>(
      columnValues: columnValues(Concession.t.updateTable),
      where: where(Concession.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Concession.t),
      orderByList: orderByList?.call(Concession.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Concession]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Concession>> delete(
    _i1.DatabaseSession session,
    List<Concession> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Concession>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Concession].
  Future<Concession> deleteRow(
    _i1.DatabaseSession session,
    Concession row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Concession>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Concession>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ConcessionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Concession>(
      where: where(Concession.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ConcessionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Concession>(
      where: where?.call(Concession.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Concession] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ConcessionTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Concession>(
      where: where(Concession.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
