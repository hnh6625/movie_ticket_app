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
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../showtimes/showtime.dart' as _i2;
import 'package:movie_ticket_app_client/src/protocol/protocol.dart' as _i3;

abstract class Movie implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
