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

abstract class ShowtimeSeatReleasePayload
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ShowtimeSeatReleasePayload._({required this.showtimeSeatId});

  factory ShowtimeSeatReleasePayload({required int showtimeSeatId}) =
      _ShowtimeSeatReleasePayloadImpl;

  factory ShowtimeSeatReleasePayload.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ShowtimeSeatReleasePayload(
      showtimeSeatId: jsonSerialization['showtimeSeatId'] as int,
    );
  }

  int showtimeSeatId;

  /// Returns a shallow copy of this [ShowtimeSeatReleasePayload]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ShowtimeSeatReleasePayload copyWith({int? showtimeSeatId});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ShowtimeSeatReleasePayload',
      'showtimeSeatId': showtimeSeatId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ShowtimeSeatReleasePayload',
      'showtimeSeatId': showtimeSeatId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ShowtimeSeatReleasePayloadImpl extends ShowtimeSeatReleasePayload {
  _ShowtimeSeatReleasePayloadImpl({required int showtimeSeatId})
    : super._(showtimeSeatId: showtimeSeatId);

  /// Returns a shallow copy of this [ShowtimeSeatReleasePayload]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ShowtimeSeatReleasePayload copyWith({int? showtimeSeatId}) {
    return ShowtimeSeatReleasePayload(
      showtimeSeatId: showtimeSeatId ?? this.showtimeSeatId,
    );
  }
}
