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
import 'cinemas/cinema.dart' as _i2;
import 'cinemas/room.dart' as _i3;
import 'cinemas/seat.dart' as _i4;
import 'concessions/concession.dart' as _i5;
import 'greetings/greeting.dart' as _i6;
import 'movies/movie.dart' as _i7;
import 'showtimes/showtime.dart' as _i8;
import 'showtimes/showtime_seat.dart' as _i9;
import 'package:movie_ticket_app_client/src/protocol/cinemas/cinema.dart'
    as _i10;
import 'package:movie_ticket_app_client/src/protocol/concessions/concession.dart'
    as _i11;
import 'package:movie_ticket_app_client/src/protocol/movies/movie.dart' as _i12;
import 'package:movie_ticket_app_client/src/protocol/showtimes/showtime.dart'
    as _i13;
import 'package:movie_ticket_app_client/src/protocol/showtimes/showtime_seat.dart'
    as _i14;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i15;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i16;
export 'cinemas/cinema.dart';
export 'cinemas/room.dart';
export 'cinemas/seat.dart';
export 'concessions/concession.dart';
export 'greetings/greeting.dart';
export 'movies/movie.dart';
export 'showtimes/showtime.dart';
export 'showtimes/showtime_seat.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.Cinema) {
      return _i2.Cinema.fromJson(data) as T;
    }
    if (t == _i3.Room) {
      return _i3.Room.fromJson(data) as T;
    }
    if (t == _i4.Seat) {
      return _i4.Seat.fromJson(data) as T;
    }
    if (t == _i5.Concession) {
      return _i5.Concession.fromJson(data) as T;
    }
    if (t == _i6.Greeting) {
      return _i6.Greeting.fromJson(data) as T;
    }
    if (t == _i7.Movie) {
      return _i7.Movie.fromJson(data) as T;
    }
    if (t == _i8.Showtime) {
      return _i8.Showtime.fromJson(data) as T;
    }
    if (t == _i9.ShowtimeSeat) {
      return _i9.ShowtimeSeat.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Cinema?>()) {
      return (data != null ? _i2.Cinema.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Room?>()) {
      return (data != null ? _i3.Room.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Seat?>()) {
      return (data != null ? _i4.Seat.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Concession?>()) {
      return (data != null ? _i5.Concession.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Greeting?>()) {
      return (data != null ? _i6.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Movie?>()) {
      return (data != null ? _i7.Movie.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Showtime?>()) {
      return (data != null ? _i8.Showtime.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.ShowtimeSeat?>()) {
      return (data != null ? _i9.ShowtimeSeat.fromJson(data) : null) as T;
    }
    if (t == List<_i3.Room>) {
      return (data as List).map((e) => deserialize<_i3.Room>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i3.Room>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i3.Room>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i4.Seat>) {
      return (data as List).map((e) => deserialize<_i4.Seat>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i4.Seat>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i4.Seat>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i8.Showtime>) {
      return (data as List).map((e) => deserialize<_i8.Showtime>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i8.Showtime>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i8.Showtime>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i9.ShowtimeSeat>) {
      return (data as List)
              .map((e) => deserialize<_i9.ShowtimeSeat>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i9.ShowtimeSeat>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i9.ShowtimeSeat>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i10.Cinema>) {
      return (data as List).map((e) => deserialize<_i10.Cinema>(e)).toList()
          as T;
    }
    if (t == List<_i11.Concession>) {
      return (data as List).map((e) => deserialize<_i11.Concession>(e)).toList()
          as T;
    }
    if (t == List<_i12.Movie>) {
      return (data as List).map((e) => deserialize<_i12.Movie>(e)).toList()
          as T;
    }
    if (t == List<_i13.Showtime>) {
      return (data as List).map((e) => deserialize<_i13.Showtime>(e)).toList()
          as T;
    }
    if (t == List<_i14.ShowtimeSeat>) {
      return (data as List)
              .map((e) => deserialize<_i14.ShowtimeSeat>(e))
              .toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    try {
      return _i15.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i16.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Cinema => 'Cinema',
      _i3.Room => 'Room',
      _i4.Seat => 'Seat',
      _i5.Concession => 'Concession',
      _i6.Greeting => 'Greeting',
      _i7.Movie => 'Movie',
      _i8.Showtime => 'Showtime',
      _i9.ShowtimeSeat => 'ShowtimeSeat',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'movie_ticket_app.',
        '',
      );
    }

    switch (data) {
      case _i2.Cinema():
        return 'Cinema';
      case _i3.Room():
        return 'Room';
      case _i4.Seat():
        return 'Seat';
      case _i5.Concession():
        return 'Concession';
      case _i6.Greeting():
        return 'Greeting';
      case _i7.Movie():
        return 'Movie';
      case _i8.Showtime():
        return 'Showtime';
      case _i9.ShowtimeSeat():
        return 'ShowtimeSeat';
    }
    className = _i15.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i16.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Cinema') {
      return deserialize<_i2.Cinema>(data['data']);
    }
    if (dataClassName == 'Room') {
      return deserialize<_i3.Room>(data['data']);
    }
    if (dataClassName == 'Seat') {
      return deserialize<_i4.Seat>(data['data']);
    }
    if (dataClassName == 'Concession') {
      return deserialize<_i5.Concession>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i6.Greeting>(data['data']);
    }
    if (dataClassName == 'Movie') {
      return deserialize<_i7.Movie>(data['data']);
    }
    if (dataClassName == 'Showtime') {
      return deserialize<_i8.Showtime>(data['data']);
    }
    if (dataClassName == 'ShowtimeSeat') {
      return deserialize<_i9.ShowtimeSeat>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i15.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i16.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i15.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i16.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
