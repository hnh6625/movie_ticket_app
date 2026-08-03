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

abstract class UserProfile implements _i1.SerializableModel {
  UserProfile._({
    this.id,
    required this.userIdentifier,
    required this.email,
    required this.name,
    this.phone,
    this.avatarUrl,
    required this.role,
    required this.createdAt,
  });

  factory UserProfile({
    int? id,
    required String userIdentifier,
    required String email,
    required String name,
    String? phone,
    String? avatarUrl,
    required String role,
    required DateTime createdAt,
  }) = _UserProfileImpl;

  factory UserProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserProfile(
      id: jsonSerialization['id'] as int?,
      userIdentifier: jsonSerialization['userIdentifier'] as String,
      email: jsonSerialization['email'] as String,
      name: jsonSerialization['name'] as String,
      phone: jsonSerialization['phone'] as String?,
      avatarUrl: jsonSerialization['avatarUrl'] as String?,
      role: jsonSerialization['role'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String userIdentifier;

  String email;

  String name;

  String? phone;

  String? avatarUrl;

  String role;

  DateTime createdAt;

  /// Returns a shallow copy of this [UserProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserProfile copyWith({
    int? id,
    String? userIdentifier,
    String? email,
    String? name,
    String? phone,
    String? avatarUrl,
    String? role,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserProfile',
      if (id != null) 'id': id,
      'userIdentifier': userIdentifier,
      'email': email,
      'name': name,
      if (phone != null) 'phone': phone,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      'role': role,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserProfileImpl extends UserProfile {
  _UserProfileImpl({
    int? id,
    required String userIdentifier,
    required String email,
    required String name,
    String? phone,
    String? avatarUrl,
    required String role,
    required DateTime createdAt,
  }) : super._(
         id: id,
         userIdentifier: userIdentifier,
         email: email,
         name: name,
         phone: phone,
         avatarUrl: avatarUrl,
         role: role,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [UserProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserProfile copyWith({
    Object? id = _Undefined,
    String? userIdentifier,
    String? email,
    String? name,
    Object? phone = _Undefined,
    Object? avatarUrl = _Undefined,
    String? role,
    DateTime? createdAt,
  }) {
    return UserProfile(
      id: id is int? ? id : this.id,
      userIdentifier: userIdentifier ?? this.userIdentifier,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone is String? ? phone : this.phone,
      avatarUrl: avatarUrl is String? ? avatarUrl : this.avatarUrl,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
