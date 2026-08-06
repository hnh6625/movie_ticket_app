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
import 'orders/order.dart' as _i8;
import 'orders/order_concession.dart' as _i9;
import 'orders/order_create_result.dart' as _i10;
import 'orders/order_seat.dart' as _i11;
import 'orders/order_used_payload.dart' as _i12;
import 'reviews/review.dart' as _i13;
import 'reviews/review_create_result.dart' as _i14;
import 'showtimes/seat_hold_result.dart' as _i15;
import 'showtimes/showtime.dart' as _i16;
import 'showtimes/showtime_seat.dart' as _i17;
import 'showtimes/showtime_seat_release_payload.dart' as _i18;
import 'users/user_profile.dart' as _i19;
import 'package:movie_ticket_app_client/src/protocol/cinemas/cinema.dart'
    as _i20;
import 'package:movie_ticket_app_client/src/protocol/concessions/concession.dart'
    as _i21;
import 'package:movie_ticket_app_client/src/protocol/movies/movie.dart' as _i22;
import 'package:movie_ticket_app_client/src/protocol/orders/order.dart' as _i23;
import 'package:movie_ticket_app_client/src/protocol/reviews/review.dart'
    as _i24;
import 'package:movie_ticket_app_client/src/protocol/showtimes/showtime.dart'
    as _i25;
import 'package:movie_ticket_app_client/src/protocol/showtimes/showtime_seat.dart'
    as _i26;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i27;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i28;
export 'cinemas/cinema.dart';
export 'cinemas/room.dart';
export 'cinemas/seat.dart';
export 'concessions/concession.dart';
export 'greetings/greeting.dart';
export 'movies/movie.dart';
export 'orders/order.dart';
export 'orders/order_concession.dart';
export 'orders/order_create_result.dart';
export 'orders/order_seat.dart';
export 'orders/order_used_payload.dart';
export 'reviews/review.dart';
export 'reviews/review_create_result.dart';
export 'showtimes/seat_hold_result.dart';
export 'showtimes/showtime.dart';
export 'showtimes/showtime_seat.dart';
export 'showtimes/showtime_seat_release_payload.dart';
export 'users/user_profile.dart';
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
    if (t == _i8.Order) {
      return _i8.Order.fromJson(data) as T;
    }
    if (t == _i9.OrderConcession) {
      return _i9.OrderConcession.fromJson(data) as T;
    }
    if (t == _i10.OrderCreateResult) {
      return _i10.OrderCreateResult.fromJson(data) as T;
    }
    if (t == _i11.OrderSeat) {
      return _i11.OrderSeat.fromJson(data) as T;
    }
    if (t == _i12.OrderUsedPayload) {
      return _i12.OrderUsedPayload.fromJson(data) as T;
    }
    if (t == _i13.Review) {
      return _i13.Review.fromJson(data) as T;
    }
    if (t == _i14.ReviewCreateResult) {
      return _i14.ReviewCreateResult.fromJson(data) as T;
    }
    if (t == _i15.SeatHoldResult) {
      return _i15.SeatHoldResult.fromJson(data) as T;
    }
    if (t == _i16.Showtime) {
      return _i16.Showtime.fromJson(data) as T;
    }
    if (t == _i17.ShowtimeSeat) {
      return _i17.ShowtimeSeat.fromJson(data) as T;
    }
    if (t == _i18.ShowtimeSeatReleasePayload) {
      return _i18.ShowtimeSeatReleasePayload.fromJson(data) as T;
    }
    if (t == _i19.UserProfile) {
      return _i19.UserProfile.fromJson(data) as T;
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
    if (t == _i1.getType<_i8.Order?>()) {
      return (data != null ? _i8.Order.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.OrderConcession?>()) {
      return (data != null ? _i9.OrderConcession.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.OrderCreateResult?>()) {
      return (data != null ? _i10.OrderCreateResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.OrderSeat?>()) {
      return (data != null ? _i11.OrderSeat.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.OrderUsedPayload?>()) {
      return (data != null ? _i12.OrderUsedPayload.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Review?>()) {
      return (data != null ? _i13.Review.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.ReviewCreateResult?>()) {
      return (data != null ? _i14.ReviewCreateResult.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i15.SeatHoldResult?>()) {
      return (data != null ? _i15.SeatHoldResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Showtime?>()) {
      return (data != null ? _i16.Showtime.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.ShowtimeSeat?>()) {
      return (data != null ? _i17.ShowtimeSeat.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.ShowtimeSeatReleasePayload?>()) {
      return (data != null
              ? _i18.ShowtimeSeatReleasePayload.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i19.UserProfile?>()) {
      return (data != null ? _i19.UserProfile.fromJson(data) : null) as T;
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
    if (t == List<_i16.Showtime>) {
      return (data as List).map((e) => deserialize<_i16.Showtime>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i16.Showtime>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i16.Showtime>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i17.ShowtimeSeat>) {
      return (data as List)
              .map((e) => deserialize<_i17.ShowtimeSeat>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i17.ShowtimeSeat>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i17.ShowtimeSeat>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i13.Review>) {
      return (data as List).map((e) => deserialize<_i13.Review>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i13.Review>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i13.Review>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i11.OrderSeat>) {
      return (data as List).map((e) => deserialize<_i11.OrderSeat>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i11.OrderSeat>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i11.OrderSeat>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i9.OrderConcession>) {
      return (data as List)
              .map((e) => deserialize<_i9.OrderConcession>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i9.OrderConcession>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i9.OrderConcession>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i8.Order>) {
      return (data as List).map((e) => deserialize<_i8.Order>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i8.Order>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i8.Order>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i20.Cinema>) {
      return (data as List).map((e) => deserialize<_i20.Cinema>(e)).toList()
          as T;
    }
    if (t == List<_i21.Concession>) {
      return (data as List).map((e) => deserialize<_i21.Concession>(e)).toList()
          as T;
    }
    if (t == List<_i22.Movie>) {
      return (data as List).map((e) => deserialize<_i22.Movie>(e)).toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == Map<int, int>) {
      return Map.fromEntries(
            (data as List).map(
              (e) =>
                  MapEntry(deserialize<int>(e['k']), deserialize<int>(e['v'])),
            ),
          )
          as T;
    }
    if (t == List<_i23.Order>) {
      return (data as List).map((e) => deserialize<_i23.Order>(e)).toList()
          as T;
    }
    if (t == List<_i24.Review>) {
      return (data as List).map((e) => deserialize<_i24.Review>(e)).toList()
          as T;
    }
    if (t == List<_i25.Showtime>) {
      return (data as List).map((e) => deserialize<_i25.Showtime>(e)).toList()
          as T;
    }
    if (t == List<_i26.ShowtimeSeat>) {
      return (data as List)
              .map((e) => deserialize<_i26.ShowtimeSeat>(e))
              .toList()
          as T;
    }
    try {
      return _i27.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i28.Protocol().deserialize<T>(data, t);
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
      _i8.Order => 'Order',
      _i9.OrderConcession => 'OrderConcession',
      _i10.OrderCreateResult => 'OrderCreateResult',
      _i11.OrderSeat => 'OrderSeat',
      _i12.OrderUsedPayload => 'OrderUsedPayload',
      _i13.Review => 'Review',
      _i14.ReviewCreateResult => 'ReviewCreateResult',
      _i15.SeatHoldResult => 'SeatHoldResult',
      _i16.Showtime => 'Showtime',
      _i17.ShowtimeSeat => 'ShowtimeSeat',
      _i18.ShowtimeSeatReleasePayload => 'ShowtimeSeatReleasePayload',
      _i19.UserProfile => 'UserProfile',
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
      case _i8.Order():
        return 'Order';
      case _i9.OrderConcession():
        return 'OrderConcession';
      case _i10.OrderCreateResult():
        return 'OrderCreateResult';
      case _i11.OrderSeat():
        return 'OrderSeat';
      case _i12.OrderUsedPayload():
        return 'OrderUsedPayload';
      case _i13.Review():
        return 'Review';
      case _i14.ReviewCreateResult():
        return 'ReviewCreateResult';
      case _i15.SeatHoldResult():
        return 'SeatHoldResult';
      case _i16.Showtime():
        return 'Showtime';
      case _i17.ShowtimeSeat():
        return 'ShowtimeSeat';
      case _i18.ShowtimeSeatReleasePayload():
        return 'ShowtimeSeatReleasePayload';
      case _i19.UserProfile():
        return 'UserProfile';
    }
    className = _i27.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i28.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'Order') {
      return deserialize<_i8.Order>(data['data']);
    }
    if (dataClassName == 'OrderConcession') {
      return deserialize<_i9.OrderConcession>(data['data']);
    }
    if (dataClassName == 'OrderCreateResult') {
      return deserialize<_i10.OrderCreateResult>(data['data']);
    }
    if (dataClassName == 'OrderSeat') {
      return deserialize<_i11.OrderSeat>(data['data']);
    }
    if (dataClassName == 'OrderUsedPayload') {
      return deserialize<_i12.OrderUsedPayload>(data['data']);
    }
    if (dataClassName == 'Review') {
      return deserialize<_i13.Review>(data['data']);
    }
    if (dataClassName == 'ReviewCreateResult') {
      return deserialize<_i14.ReviewCreateResult>(data['data']);
    }
    if (dataClassName == 'SeatHoldResult') {
      return deserialize<_i15.SeatHoldResult>(data['data']);
    }
    if (dataClassName == 'Showtime') {
      return deserialize<_i16.Showtime>(data['data']);
    }
    if (dataClassName == 'ShowtimeSeat') {
      return deserialize<_i17.ShowtimeSeat>(data['data']);
    }
    if (dataClassName == 'ShowtimeSeatReleasePayload') {
      return deserialize<_i18.ShowtimeSeatReleasePayload>(data['data']);
    }
    if (dataClassName == 'UserProfile') {
      return deserialize<_i19.UserProfile>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i27.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i28.Protocol().deserializeByClassName(data);
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
      return _i27.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i28.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }

  /// Maps container types (like [List], [Map], [Set]) containing
  /// [Record]s or non-String-keyed [Map]s to their JSON representation.
  ///
  /// It should not be called for [SerializableModel] types. These
  /// handle the "[Record] in container" mapping internally already.
  ///
  /// It is only supposed to be called from generated protocol code.
  ///
  /// Returns either a `List<dynamic>` (for List, Sets, and Maps with
  /// non-String keys) or a `Map<String, dynamic>` in case the input was
  /// a `Map<String, …>`.
  Object? mapContainerToJson(Object obj) {
    if (obj is! Iterable && obj is! Map) {
      throw ArgumentError.value(
        obj,
        'obj',
        'The object to serialize should be of type List, Map, or Set',
      );
    }

    dynamic mapIfNeeded(Object? obj) {
      return switch (obj) {
        Record record => mapRecordToJson(record),
        Iterable iterable => mapContainerToJson(iterable),
        Map map => mapContainerToJson(map),
        Object? value => value,
      };
    }

    switch (obj) {
      case Map<String, dynamic>():
        return {
          for (var entry in obj.entries) entry.key: mapIfNeeded(entry.value),
        };
      case Map():
        return [
          for (var entry in obj.entries)
            {
              'k': mapIfNeeded(entry.key),
              'v': mapIfNeeded(entry.value),
            },
        ];

      case Iterable():
        return [
          for (var e in obj) mapIfNeeded(e),
        ];
    }

    return obj;
  }
}
