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

abstract class Review implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int movieId;

  String userIdentifier;

  int rating;

  String comment;

  DateTime createdAt;

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
