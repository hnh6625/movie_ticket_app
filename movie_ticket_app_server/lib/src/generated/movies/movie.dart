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
import '../showtimes/showtime.dart' as _i2;
import 'package:movie_ticket_app_server/src/generated/protocol.dart' as _i3;

abstract class Movie implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Movie._({
    this.id,
    required this.title,
    required this.description,
    required this.posterUrl,
    required this.trailerYoutubeId,
    required this.genre,
    required this.durationMinutes,
    required this.releaseDate,
    required this.status,
    required this.avgRating,
    required this.createdAt,
    this.showtimes,
  });

  factory Movie({
    int? id,
    required String title,
    required String description,
    required String posterUrl,
    required String trailerYoutubeId,
    required String genre,
    required int durationMinutes,
    required DateTime releaseDate,
    required String status,
    required double avgRating,
    required DateTime createdAt,
    List<_i2.Showtime>? showtimes,
  }) = _MovieImpl;

  factory Movie.fromJson(Map<String, dynamic> jsonSerialization) {
    return Movie(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      posterUrl: jsonSerialization['posterUrl'] as String,
      trailerYoutubeId: jsonSerialization['trailerYoutubeId'] as String,
      genre: jsonSerialization['genre'] as String,
      durationMinutes: jsonSerialization['durationMinutes'] as int,
      releaseDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['releaseDate'],
      ),
      status: jsonSerialization['status'] as String,
      avgRating: (jsonSerialization['avgRating'] as num).toDouble(),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      showtimes: jsonSerialization['showtimes'] == null
          ? null
          : _i3.Protocol().deserialize<List<_i2.Showtime>>(
              jsonSerialization['showtimes'],
            ),
    );
  }

  static final t = MovieTable();

  static const db = MovieRepository._();

  @override
  int? id;

  String title;

  String description;

  String posterUrl;

  String trailerYoutubeId;

  String genre;

  int durationMinutes;

  DateTime releaseDate;

  String status;

  double avgRating;

  DateTime createdAt;

  List<_i2.Showtime>? showtimes;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Movie]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Movie copyWith({
    int? id,
    String? title,
    String? description,
    String? posterUrl,
    String? trailerYoutubeId,
    String? genre,
    int? durationMinutes,
    DateTime? releaseDate,
    String? status,
    double? avgRating,
    DateTime? createdAt,
    List<_i2.Showtime>? showtimes,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Movie',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'posterUrl': posterUrl,
      'trailerYoutubeId': trailerYoutubeId,
      'genre': genre,
      'durationMinutes': durationMinutes,
      'releaseDate': releaseDate.toJson(),
      'status': status,
      'avgRating': avgRating,
      'createdAt': createdAt.toJson(),
      if (showtimes != null)
        'showtimes': showtimes?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Movie',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'posterUrl': posterUrl,
      'trailerYoutubeId': trailerYoutubeId,
      'genre': genre,
      'durationMinutes': durationMinutes,
      'releaseDate': releaseDate.toJson(),
      'status': status,
      'avgRating': avgRating,
      'createdAt': createdAt.toJson(),
      if (showtimes != null)
        'showtimes': showtimes?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static MovieInclude include({_i2.ShowtimeIncludeList? showtimes}) {
    return MovieInclude._(showtimes: showtimes);
  }

  static MovieIncludeList includeList({
    _i1.WhereExpressionBuilder<MovieTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MovieTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MovieTable>? orderByList,
    MovieInclude? include,
  }) {
    return MovieIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Movie.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Movie.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MovieImpl extends Movie {
  _MovieImpl({
    int? id,
    required String title,
    required String description,
    required String posterUrl,
    required String trailerYoutubeId,
    required String genre,
    required int durationMinutes,
    required DateTime releaseDate,
    required String status,
    required double avgRating,
    required DateTime createdAt,
    List<_i2.Showtime>? showtimes,
  }) : super._(
         id: id,
         title: title,
         description: description,
         posterUrl: posterUrl,
         trailerYoutubeId: trailerYoutubeId,
         genre: genre,
         durationMinutes: durationMinutes,
         releaseDate: releaseDate,
         status: status,
         avgRating: avgRating,
         createdAt: createdAt,
         showtimes: showtimes,
       );

  /// Returns a shallow copy of this [Movie]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Movie copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    String? posterUrl,
    String? trailerYoutubeId,
    String? genre,
    int? durationMinutes,
    DateTime? releaseDate,
    String? status,
    double? avgRating,
    DateTime? createdAt,
    Object? showtimes = _Undefined,
  }) {
    return Movie(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      posterUrl: posterUrl ?? this.posterUrl,
      trailerYoutubeId: trailerYoutubeId ?? this.trailerYoutubeId,
      genre: genre ?? this.genre,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      releaseDate: releaseDate ?? this.releaseDate,
      status: status ?? this.status,
      avgRating: avgRating ?? this.avgRating,
      createdAt: createdAt ?? this.createdAt,
      showtimes: showtimes is List<_i2.Showtime>?
          ? showtimes
          : this.showtimes?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class MovieUpdateTable extends _i1.UpdateTable<MovieTable> {
  MovieUpdateTable(super.table);

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> description(String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<String, String> posterUrl(String value) => _i1.ColumnValue(
    table.posterUrl,
    value,
  );

  _i1.ColumnValue<String, String> trailerYoutubeId(String value) =>
      _i1.ColumnValue(
        table.trailerYoutubeId,
        value,
      );

  _i1.ColumnValue<String, String> genre(String value) => _i1.ColumnValue(
    table.genre,
    value,
  );

  _i1.ColumnValue<int, int> durationMinutes(int value) => _i1.ColumnValue(
    table.durationMinutes,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> releaseDate(DateTime value) =>
      _i1.ColumnValue(
        table.releaseDate,
        value,
      );

  _i1.ColumnValue<String, String> status(String value) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<double, double> avgRating(double value) => _i1.ColumnValue(
    table.avgRating,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class MovieTable extends _i1.Table<int?> {
  MovieTable({super.tableRelation}) : super(tableName: 'movies') {
    updateTable = MovieUpdateTable(this);
    title = _i1.ColumnString(
      'title',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    posterUrl = _i1.ColumnString(
      'posterUrl',
      this,
    );
    trailerYoutubeId = _i1.ColumnString(
      'trailerYoutubeId',
      this,
    );
    genre = _i1.ColumnString(
      'genre',
      this,
    );
    durationMinutes = _i1.ColumnInt(
      'durationMinutes',
      this,
    );
    releaseDate = _i1.ColumnDateTime(
      'releaseDate',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    avgRating = _i1.ColumnDouble(
      'avgRating',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final MovieUpdateTable updateTable;

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  late final _i1.ColumnString posterUrl;

  late final _i1.ColumnString trailerYoutubeId;

  late final _i1.ColumnString genre;

  late final _i1.ColumnInt durationMinutes;

  late final _i1.ColumnDateTime releaseDate;

  late final _i1.ColumnString status;

  late final _i1.ColumnDouble avgRating;

  late final _i1.ColumnDateTime createdAt;

  _i2.ShowtimeTable? ___showtimes;

  _i1.ManyRelation<_i2.ShowtimeTable>? _showtimes;

  _i2.ShowtimeTable get __showtimes {
    if (___showtimes != null) return ___showtimes!;
    ___showtimes = _i1.createRelationTable(
      relationFieldName: '__showtimes',
      field: Movie.t.id,
      foreignField: _i2.Showtime.t.movieId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ShowtimeTable(tableRelation: foreignTableRelation),
    );
    return ___showtimes!;
  }

  _i1.ManyRelation<_i2.ShowtimeTable> get showtimes {
    if (_showtimes != null) return _showtimes!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'showtimes',
      field: Movie.t.id,
      foreignField: _i2.Showtime.t.movieId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ShowtimeTable(tableRelation: foreignTableRelation),
    );
    _showtimes = _i1.ManyRelation<_i2.ShowtimeTable>(
      tableWithRelations: relationTable,
      table: _i2.ShowtimeTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _showtimes!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    title,
    description,
    posterUrl,
    trailerYoutubeId,
    genre,
    durationMinutes,
    releaseDate,
    status,
    avgRating,
    createdAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'showtimes') {
      return __showtimes;
    }
    return null;
  }
}

class MovieInclude extends _i1.IncludeObject {
  MovieInclude._({_i2.ShowtimeIncludeList? showtimes}) {
    _showtimes = showtimes;
  }

  _i2.ShowtimeIncludeList? _showtimes;

  @override
  Map<String, _i1.Include?> get includes => {'showtimes': _showtimes};

  @override
  _i1.Table<int?> get table => Movie.t;
}

class MovieIncludeList extends _i1.IncludeList {
  MovieIncludeList._({
    _i1.WhereExpressionBuilder<MovieTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Movie.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Movie.t;
}

class MovieRepository {
  const MovieRepository._();

  final attach = const MovieAttachRepository._();

  final attachRow = const MovieAttachRowRepository._();

  /// Returns a list of [Movie]s matching the given query parameters.
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
  Future<List<Movie>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<MovieTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MovieTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MovieTable>? orderByList,
    _i1.Transaction? transaction,
    MovieInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Movie>(
      where: where?.call(Movie.t),
      orderBy: orderBy?.call(Movie.t),
      orderByList: orderByList?.call(Movie.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Movie] matching the given query parameters.
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
  Future<Movie?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<MovieTable>? where,
    int? offset,
    _i1.OrderByBuilder<MovieTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MovieTable>? orderByList,
    _i1.Transaction? transaction,
    MovieInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Movie>(
      where: where?.call(Movie.t),
      orderBy: orderBy?.call(Movie.t),
      orderByList: orderByList?.call(Movie.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Movie] by its [id] or null if no such row exists.
  Future<Movie?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    MovieInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Movie>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Movie]s in the list and returns the inserted rows.
  ///
  /// The returned [Movie]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Movie>> insert(
    _i1.DatabaseSession session,
    List<Movie> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Movie>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Movie] and returns the inserted row.
  ///
  /// The returned [Movie] will have its `id` field set.
  Future<Movie> insertRow(
    _i1.DatabaseSession session,
    Movie row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Movie>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Movie]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Movie>> update(
    _i1.DatabaseSession session,
    List<Movie> rows, {
    _i1.ColumnSelections<MovieTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Movie>(
      rows,
      columns: columns?.call(Movie.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Movie]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Movie> updateRow(
    _i1.DatabaseSession session,
    Movie row, {
    _i1.ColumnSelections<MovieTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Movie>(
      row,
      columns: columns?.call(Movie.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Movie] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Movie?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<MovieUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Movie>(
      id,
      columnValues: columnValues(Movie.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Movie]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Movie>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<MovieUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<MovieTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MovieTable>? orderBy,
    _i1.OrderByListBuilder<MovieTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Movie>(
      columnValues: columnValues(Movie.t.updateTable),
      where: where(Movie.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Movie.t),
      orderByList: orderByList?.call(Movie.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Movie]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Movie>> delete(
    _i1.DatabaseSession session,
    List<Movie> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Movie>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Movie].
  Future<Movie> deleteRow(
    _i1.DatabaseSession session,
    Movie row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Movie>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Movie>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<MovieTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Movie>(
      where: where(Movie.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<MovieTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Movie>(
      where: where?.call(Movie.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Movie] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<MovieTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Movie>(
      where: where(Movie.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class MovieAttachRepository {
  const MovieAttachRepository._();

  /// Creates a relation between this [Movie] and the given [Showtime]s
  /// by setting each [Showtime]'s foreign key `movieId` to refer to this [Movie].
  Future<void> showtimes(
    _i1.DatabaseSession session,
    Movie movie,
    List<_i2.Showtime> showtime, {
    _i1.Transaction? transaction,
  }) async {
    if (showtime.any((e) => e.id == null)) {
      throw ArgumentError.notNull('showtime.id');
    }
    if (movie.id == null) {
      throw ArgumentError.notNull('movie.id');
    }

    var $showtime = showtime.map((e) => e.copyWith(movieId: movie.id)).toList();
    await session.db.update<_i2.Showtime>(
      $showtime,
      columns: [_i2.Showtime.t.movieId],
      transaction: transaction,
    );
  }
}

class MovieAttachRowRepository {
  const MovieAttachRowRepository._();

  /// Creates a relation between this [Movie] and the given [Showtime]
  /// by setting the [Showtime]'s foreign key `movieId` to refer to this [Movie].
  Future<void> showtimes(
    _i1.DatabaseSession session,
    Movie movie,
    _i2.Showtime showtime, {
    _i1.Transaction? transaction,
  }) async {
    if (showtime.id == null) {
      throw ArgumentError.notNull('showtime.id');
    }
    if (movie.id == null) {
      throw ArgumentError.notNull('movie.id');
    }

    var $showtime = showtime.copyWith(movieId: movie.id);
    await session.db.updateRow<_i2.Showtime>(
      $showtime,
      columns: [_i2.Showtime.t.movieId],
      transaction: transaction,
    );
  }
}
