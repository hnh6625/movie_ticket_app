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
import '../cinemas/room.dart' as _i2;
import 'package:movie_ticket_app_client/src/protocol/protocol.dart' as _i3;

abstract class Cinema implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String address;

  double latitude;

  double longitude;

  List<_i2.Room>? rooms;

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
