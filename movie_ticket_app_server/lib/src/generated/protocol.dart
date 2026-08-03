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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i3;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i4;
import 'cinemas/cinema.dart' as _i5;
import 'cinemas/room.dart' as _i6;
import 'cinemas/seat.dart' as _i7;
import 'concessions/concession.dart' as _i8;
import 'greetings/greeting.dart' as _i9;
import 'movies/movie.dart' as _i10;
import 'orders/order.dart' as _i11;
import 'orders/order_concession.dart' as _i12;
import 'orders/order_seat.dart' as _i13;
import 'reviews/review.dart' as _i14;
import 'showtimes/showtime.dart' as _i15;
import 'showtimes/showtime_seat.dart' as _i16;
import 'showtimes/showtime_seat_release_payload.dart' as _i17;
import 'users/user_profile.dart' as _i18;
import 'package:movie_ticket_app_server/src/generated/cinemas/cinema.dart'
    as _i19;
import 'package:movie_ticket_app_server/src/generated/concessions/concession.dart'
    as _i20;
import 'package:movie_ticket_app_server/src/generated/movies/movie.dart'
    as _i21;
import 'package:movie_ticket_app_server/src/generated/orders/order.dart'
    as _i22;
import 'package:movie_ticket_app_server/src/generated/reviews/review.dart'
    as _i23;
import 'package:movie_ticket_app_server/src/generated/showtimes/showtime.dart'
    as _i24;
import 'package:movie_ticket_app_server/src/generated/showtimes/showtime_seat.dart'
    as _i25;
export 'cinemas/cinema.dart';
export 'cinemas/room.dart';
export 'cinemas/seat.dart';
export 'concessions/concession.dart';
export 'greetings/greeting.dart';
export 'movies/movie.dart';
export 'orders/order.dart';
export 'orders/order_concession.dart';
export 'orders/order_seat.dart';
export 'reviews/review.dart';
export 'showtimes/showtime.dart';
export 'showtimes/showtime_seat.dart';
export 'showtimes/showtime_seat_release_payload.dart';
export 'users/user_profile.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'cinemas',
      dartName: 'Cinema',
      schema: 'public',
      module: 'movie_ticket_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'cinemas_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'address',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'latitude',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'longitude',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'cinemas_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'concessions',
      dartName: 'Concession',
      schema: 'public',
      module: 'movie_ticket_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'concessions_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'imageUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'price',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'concessions_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'movies',
      dartName: 'Movie',
      schema: 'public',
      module: 'movie_ticket_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'movies_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'posterUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'trailerYoutubeId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'genre',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'durationMinutes',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'releaseDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'avgRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'movies_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'order_concessions',
      dartName: 'OrderConcession',
      schema: 'public',
      module: 'movie_ticket_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'order_concessions_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'orderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'concessionId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'quantity',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'price',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'order_concessions_fk_0',
          columns: ['orderId'],
          referenceTable: 'orders',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'order_concessions_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'order_seats',
      dartName: 'OrderSeat',
      schema: 'public',
      module: 'movie_ticket_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'order_seats_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'orderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'showtimeSeatId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'price',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'order_seats_fk_0',
          columns: ['orderId'],
          referenceTable: 'orders',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'order_seats_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'orders',
      dartName: 'Order',
      schema: 'public',
      module: 'movie_ticket_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'orders_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userIdentifier',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'showtimeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'totalPrice',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'paymentMethod',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'qrCodeData',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'orders_fk_0',
          columns: ['showtimeId'],
          referenceTable: 'showtimes',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'orders_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'reviews',
      dartName: 'Review',
      schema: 'public',
      module: 'movie_ticket_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'reviews_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'movieId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'userIdentifier',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'rating',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'comment',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'reviews_fk_0',
          columns: ['movieId'],
          referenceTable: 'movies',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'reviews_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'review_movie_user_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'movieId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userIdentifier',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'rooms',
      dartName: 'Room',
      schema: 'public',
      module: 'movie_ticket_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'rooms_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'cinemaId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'roomType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'rooms_fk_0',
          columns: ['cinemaId'],
          referenceTable: 'cinemas',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'rooms_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'seats',
      dartName: 'Seat',
      schema: 'public',
      module: 'movie_ticket_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'seats_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'roomId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'rowLabel',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'seatNumber',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'seatType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'seats_fk_0',
          columns: ['roomId'],
          referenceTable: 'rooms',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'seats_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'showtime_seats',
      dartName: 'ShowtimeSeat',
      schema: 'public',
      module: 'movie_ticket_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'showtime_seats_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'showtimeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'seatId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'heldByUserId',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'holdExpiredAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'showtime_seats_fk_0',
          columns: ['showtimeId'],
          referenceTable: 'showtimes',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'showtime_seats_fk_1',
          columns: ['seatId'],
          referenceTable: 'seats',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'showtime_seats_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'showtimes',
      dartName: 'Showtime',
      schema: 'public',
      module: 'movie_ticket_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'showtimes_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'movieId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'roomId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'startTime',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'basePrice',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'showtimes_fk_0',
          columns: ['movieId'],
          referenceTable: 'movies',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'showtimes_fk_1',
          columns: ['roomId'],
          referenceTable: 'rooms',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'showtimes_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user_profiles',
      dartName: 'UserProfile',
      schema: 'public',
      module: 'movie_ticket_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_profiles_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userIdentifier',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'phone',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'avatarUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'role',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_profiles_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'user_profile_identifier_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userIdentifier',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i4.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

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

    if (t == _i5.Cinema) {
      return _i5.Cinema.fromJson(data) as T;
    }
    if (t == _i6.Room) {
      return _i6.Room.fromJson(data) as T;
    }
    if (t == _i7.Seat) {
      return _i7.Seat.fromJson(data) as T;
    }
    if (t == _i8.Concession) {
      return _i8.Concession.fromJson(data) as T;
    }
    if (t == _i9.Greeting) {
      return _i9.Greeting.fromJson(data) as T;
    }
    if (t == _i10.Movie) {
      return _i10.Movie.fromJson(data) as T;
    }
    if (t == _i11.Order) {
      return _i11.Order.fromJson(data) as T;
    }
    if (t == _i12.OrderConcession) {
      return _i12.OrderConcession.fromJson(data) as T;
    }
    if (t == _i13.OrderSeat) {
      return _i13.OrderSeat.fromJson(data) as T;
    }
    if (t == _i14.Review) {
      return _i14.Review.fromJson(data) as T;
    }
    if (t == _i15.Showtime) {
      return _i15.Showtime.fromJson(data) as T;
    }
    if (t == _i16.ShowtimeSeat) {
      return _i16.ShowtimeSeat.fromJson(data) as T;
    }
    if (t == _i17.ShowtimeSeatReleasePayload) {
      return _i17.ShowtimeSeatReleasePayload.fromJson(data) as T;
    }
    if (t == _i18.UserProfile) {
      return _i18.UserProfile.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.Cinema?>()) {
      return (data != null ? _i5.Cinema.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Room?>()) {
      return (data != null ? _i6.Room.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Seat?>()) {
      return (data != null ? _i7.Seat.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Concession?>()) {
      return (data != null ? _i8.Concession.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Greeting?>()) {
      return (data != null ? _i9.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Movie?>()) {
      return (data != null ? _i10.Movie.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Order?>()) {
      return (data != null ? _i11.Order.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.OrderConcession?>()) {
      return (data != null ? _i12.OrderConcession.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.OrderSeat?>()) {
      return (data != null ? _i13.OrderSeat.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Review?>()) {
      return (data != null ? _i14.Review.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Showtime?>()) {
      return (data != null ? _i15.Showtime.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.ShowtimeSeat?>()) {
      return (data != null ? _i16.ShowtimeSeat.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.ShowtimeSeatReleasePayload?>()) {
      return (data != null
              ? _i17.ShowtimeSeatReleasePayload.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i18.UserProfile?>()) {
      return (data != null ? _i18.UserProfile.fromJson(data) : null) as T;
    }
    if (t == List<_i6.Room>) {
      return (data as List).map((e) => deserialize<_i6.Room>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i6.Room>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i6.Room>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i7.Seat>) {
      return (data as List).map((e) => deserialize<_i7.Seat>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i7.Seat>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i7.Seat>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i15.Showtime>) {
      return (data as List).map((e) => deserialize<_i15.Showtime>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i15.Showtime>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i15.Showtime>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i16.ShowtimeSeat>) {
      return (data as List)
              .map((e) => deserialize<_i16.ShowtimeSeat>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i16.ShowtimeSeat>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i16.ShowtimeSeat>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i14.Review>) {
      return (data as List).map((e) => deserialize<_i14.Review>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i14.Review>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i14.Review>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i13.OrderSeat>) {
      return (data as List).map((e) => deserialize<_i13.OrderSeat>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i13.OrderSeat>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i13.OrderSeat>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i12.OrderConcession>) {
      return (data as List)
              .map((e) => deserialize<_i12.OrderConcession>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i12.OrderConcession>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i12.OrderConcession>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i11.Order>) {
      return (data as List).map((e) => deserialize<_i11.Order>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i11.Order>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i11.Order>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i19.Cinema>) {
      return (data as List).map((e) => deserialize<_i19.Cinema>(e)).toList()
          as T;
    }
    if (t == List<_i20.Concession>) {
      return (data as List).map((e) => deserialize<_i20.Concession>(e)).toList()
          as T;
    }
    if (t == List<_i21.Movie>) {
      return (data as List).map((e) => deserialize<_i21.Movie>(e)).toList()
          as T;
    }
    if (t == Map<String, dynamic>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<dynamic>(v)),
          )
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
    if (t == List<_i22.Order>) {
      return (data as List).map((e) => deserialize<_i22.Order>(e)).toList()
          as T;
    }
    if (t == List<_i23.Review>) {
      return (data as List).map((e) => deserialize<_i23.Review>(e)).toList()
          as T;
    }
    if (t == List<_i24.Showtime>) {
      return (data as List).map((e) => deserialize<_i24.Showtime>(e)).toList()
          as T;
    }
    if (t == List<_i25.ShowtimeSeat>) {
      return (data as List)
              .map((e) => deserialize<_i25.ShowtimeSeat>(e))
              .toList()
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i5.Cinema => 'Cinema',
      _i6.Room => 'Room',
      _i7.Seat => 'Seat',
      _i8.Concession => 'Concession',
      _i9.Greeting => 'Greeting',
      _i10.Movie => 'Movie',
      _i11.Order => 'Order',
      _i12.OrderConcession => 'OrderConcession',
      _i13.OrderSeat => 'OrderSeat',
      _i14.Review => 'Review',
      _i15.Showtime => 'Showtime',
      _i16.ShowtimeSeat => 'ShowtimeSeat',
      _i17.ShowtimeSeatReleasePayload => 'ShowtimeSeatReleasePayload',
      _i18.UserProfile => 'UserProfile',
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
      case _i5.Cinema():
        return 'Cinema';
      case _i6.Room():
        return 'Room';
      case _i7.Seat():
        return 'Seat';
      case _i8.Concession():
        return 'Concession';
      case _i9.Greeting():
        return 'Greeting';
      case _i10.Movie():
        return 'Movie';
      case _i11.Order():
        return 'Order';
      case _i12.OrderConcession():
        return 'OrderConcession';
      case _i13.OrderSeat():
        return 'OrderSeat';
      case _i14.Review():
        return 'Review';
      case _i15.Showtime():
        return 'Showtime';
      case _i16.ShowtimeSeat():
        return 'ShowtimeSeat';
      case _i17.ShowtimeSeatReleasePayload():
        return 'ShowtimeSeatReleasePayload';
      case _i18.UserProfile():
        return 'UserProfile';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i4.Protocol().getClassNameForObject(data);
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
      return deserialize<_i5.Cinema>(data['data']);
    }
    if (dataClassName == 'Room') {
      return deserialize<_i6.Room>(data['data']);
    }
    if (dataClassName == 'Seat') {
      return deserialize<_i7.Seat>(data['data']);
    }
    if (dataClassName == 'Concession') {
      return deserialize<_i8.Concession>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i9.Greeting>(data['data']);
    }
    if (dataClassName == 'Movie') {
      return deserialize<_i10.Movie>(data['data']);
    }
    if (dataClassName == 'Order') {
      return deserialize<_i11.Order>(data['data']);
    }
    if (dataClassName == 'OrderConcession') {
      return deserialize<_i12.OrderConcession>(data['data']);
    }
    if (dataClassName == 'OrderSeat') {
      return deserialize<_i13.OrderSeat>(data['data']);
    }
    if (dataClassName == 'Review') {
      return deserialize<_i14.Review>(data['data']);
    }
    if (dataClassName == 'Showtime') {
      return deserialize<_i15.Showtime>(data['data']);
    }
    if (dataClassName == 'ShowtimeSeat') {
      return deserialize<_i16.ShowtimeSeat>(data['data']);
    }
    if (dataClassName == 'ShowtimeSeatReleasePayload') {
      return deserialize<_i17.ShowtimeSeatReleasePayload>(data['data']);
    }
    if (dataClassName == 'UserProfile') {
      return deserialize<_i18.UserProfile>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i4.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i4.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i5.Cinema:
        return _i5.Cinema.t;
      case _i6.Room:
        return _i6.Room.t;
      case _i7.Seat:
        return _i7.Seat.t;
      case _i8.Concession:
        return _i8.Concession.t;
      case _i10.Movie:
        return _i10.Movie.t;
      case _i11.Order:
        return _i11.Order.t;
      case _i12.OrderConcession:
        return _i12.OrderConcession.t;
      case _i13.OrderSeat:
        return _i13.OrderSeat.t;
      case _i14.Review:
        return _i14.Review.t;
      case _i15.Showtime:
        return _i15.Showtime.t;
      case _i16.ShowtimeSeat:
        return _i16.ShowtimeSeat.t;
      case _i18.UserProfile:
        return _i18.UserProfile.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'movie_ticket_app';

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
      return _i3.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i4.Protocol().mapRecordToJson(record);
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
