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

abstract class Review implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Review._({
    this.id,
    required this.movieId,
    required this.userIdentifier,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  factory Review({
    int? id,
    required int movieId,
    required String userIdentifier,
    required int rating,
    required String comment,
    required DateTime createdAt,
  }) = _ReviewImpl;

  factory Review.fromJson(Map<String, dynamic> jsonSerialization) {
    return Review(
      id: jsonSerialization['id'] as int?,
      movieId: jsonSerialization['movieId'] as int,
      userIdentifier: jsonSerialization['userIdentifier'] as String,
      rating: jsonSerialization['rating'] as int,
      comment: jsonSerialization['comment'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = ReviewTable();

  static const db = ReviewRepository._();

  @override
  int? id;

  int movieId;

  String userIdentifier;

  int rating;

  String comment;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Review]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Review copyWith({
    int? id,
    int? movieId,
    String? userIdentifier,
    int? rating,
    String? comment,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Review',
      if (id != null) 'id': id,
      'movieId': movieId,
      'userIdentifier': userIdentifier,
      'rating': rating,
      'comment': comment,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Review',
      if (id != null) 'id': id,
      'movieId': movieId,
      'userIdentifier': userIdentifier,
      'rating': rating,
      'comment': comment,
      'createdAt': createdAt.toJson(),
    };
  }

  static ReviewInclude include() {
    return ReviewInclude._();
  }

  static ReviewIncludeList includeList({
    _i1.WhereExpressionBuilder<ReviewTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ReviewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReviewTable>? orderByList,
    ReviewInclude? include,
  }) {
    return ReviewIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Review.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Review.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ReviewImpl extends Review {
  _ReviewImpl({
    int? id,
    required int movieId,
    required String userIdentifier,
    required int rating,
    required String comment,
    required DateTime createdAt,
  }) : super._(
         id: id,
         movieId: movieId,
         userIdentifier: userIdentifier,
         rating: rating,
         comment: comment,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Review]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Review copyWith({
    Object? id = _Undefined,
    int? movieId,
    String? userIdentifier,
    int? rating,
    String? comment,
    DateTime? createdAt,
  }) {
    return Review(
      id: id is int? ? id : this.id,
      movieId: movieId ?? this.movieId,
      userIdentifier: userIdentifier ?? this.userIdentifier,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class ReviewUpdateTable extends _i1.UpdateTable<ReviewTable> {
  ReviewUpdateTable(super.table);

  _i1.ColumnValue<int, int> movieId(int value) => _i1.ColumnValue(
    table.movieId,
    value,
  );

  _i1.ColumnValue<String, String> userIdentifier(String value) =>
      _i1.ColumnValue(
        table.userIdentifier,
        value,
      );

  _i1.ColumnValue<int, int> rating(int value) => _i1.ColumnValue(
    table.rating,
    value,
  );

  _i1.ColumnValue<String, String> comment(String value) => _i1.ColumnValue(
    table.comment,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class ReviewTable extends _i1.Table<int?> {
  ReviewTable({super.tableRelation}) : super(tableName: 'reviews') {
    updateTable = ReviewUpdateTable(this);
    movieId = _i1.ColumnInt(
      'movieId',
      this,
    );
    userIdentifier = _i1.ColumnString(
      'userIdentifier',
      this,
    );
    rating = _i1.ColumnInt(
      'rating',
      this,
    );
    comment = _i1.ColumnString(
      'comment',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final ReviewUpdateTable updateTable;

  late final _i1.ColumnInt movieId;

  late final _i1.ColumnString userIdentifier;

  late final _i1.ColumnInt rating;

  late final _i1.ColumnString comment;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    movieId,
    userIdentifier,
    rating,
    comment,
    createdAt,
  ];
}

class ReviewInclude extends _i1.IncludeObject {
  ReviewInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Review.t;
}

class ReviewIncludeList extends _i1.IncludeList {
  ReviewIncludeList._({
    _i1.WhereExpressionBuilder<ReviewTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Review.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Review.t;
}

class ReviewRepository {
  const ReviewRepository._();

  /// Returns a list of [Review]s matching the given query parameters.
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
  Future<List<Review>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ReviewTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ReviewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReviewTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Review>(
      where: where?.call(Review.t),
      orderBy: orderBy?.call(Review.t),
      orderByList: orderByList?.call(Review.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Review] matching the given query parameters.
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
  Future<Review?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ReviewTable>? where,
    int? offset,
    _i1.OrderByBuilder<ReviewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReviewTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Review>(
      where: where?.call(Review.t),
      orderBy: orderBy?.call(Review.t),
      orderByList: orderByList?.call(Review.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Review] by its [id] or null if no such row exists.
  Future<Review?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Review>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Review]s in the list and returns the inserted rows.
  ///
  /// The returned [Review]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Review>> insert(
    _i1.DatabaseSession session,
    List<Review> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Review>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Review] and returns the inserted row.
  ///
  /// The returned [Review] will have its `id` field set.
  Future<Review> insertRow(
    _i1.DatabaseSession session,
    Review row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Review>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Review]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Review>> update(
    _i1.DatabaseSession session,
    List<Review> rows, {
    _i1.ColumnSelections<ReviewTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Review>(
      rows,
      columns: columns?.call(Review.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Review]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Review> updateRow(
    _i1.DatabaseSession session,
    Review row, {
    _i1.ColumnSelections<ReviewTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Review>(
      row,
      columns: columns?.call(Review.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Review] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Review?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<ReviewUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Review>(
      id,
      columnValues: columnValues(Review.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Review]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Review>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<ReviewUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ReviewTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ReviewTable>? orderBy,
    _i1.OrderByListBuilder<ReviewTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Review>(
      columnValues: columnValues(Review.t.updateTable),
      where: where(Review.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Review.t),
      orderByList: orderByList?.call(Review.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Review]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Review>> delete(
    _i1.DatabaseSession session,
    List<Review> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Review>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Review].
  Future<Review> deleteRow(
    _i1.DatabaseSession session,
    Review row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Review>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Review>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ReviewTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Review>(
      where: where(Review.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ReviewTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Review>(
      where: where?.call(Review.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Review] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ReviewTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Review>(
      where: where(Review.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
