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
import '../admin/admin_cinema_endpoint.dart' as _i2;
import '../admin/admin_movie_endpoint.dart' as _i3;
import '../admin/admin_showtime_endpoint.dart' as _i4;
import '../auth/email_idp_endpoint.dart' as _i5;
import '../auth/google_idp_endpoint.dart' as _i6;
import '../auth/jwt_refresh_endpoint.dart' as _i7;
import '../cinemas/cinema_endpoint.dart' as _i8;
import '../concessions/concession_endpoint.dart' as _i9;
import '../greetings/greeting_endpoint.dart' as _i10;
import '../movies/movie_endpoint.dart' as _i11;
import '../orders/order_endpoint.dart' as _i12;
import '../reviews/review_endpoint.dart' as _i13;
import '../showtimes/showtime_endpoint.dart' as _i14;
import '../users/user_profile_endpoint.dart' as _i15;
import 'package:movie_ticket_app_server/src/generated/cinemas/cinema.dart'
    as _i16;
import 'package:movie_ticket_app_server/src/generated/cinemas/room.dart'
    as _i17;
import 'package:movie_ticket_app_server/src/generated/movies/movie.dart'
    as _i18;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i19;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i20;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'adminCinema': _i2.AdminCinemaEndpoint()
        ..initialize(
          server,
          'adminCinema',
          null,
        ),
      'adminMovie': _i3.AdminMovieEndpoint()
        ..initialize(
          server,
          'adminMovie',
          null,
        ),
      'adminShowtime': _i4.AdminShowtimeEndpoint()
        ..initialize(
          server,
          'adminShowtime',
          null,
        ),
      'emailIdp': _i5.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'googleIdp': _i6.GoogleIdpEndpoint()
        ..initialize(
          server,
          'googleIdp',
          null,
        ),
      'refreshJwtTokens': _i7.RefreshJwtTokensEndpoint()
        ..initialize(
          server,
          'refreshJwtTokens',
          null,
        ),
      'cinema': _i8.CinemaEndpoint()
        ..initialize(
          server,
          'cinema',
          null,
        ),
      'concession': _i9.ConcessionEndpoint()
        ..initialize(
          server,
          'concession',
          null,
        ),
      'greeting': _i10.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
      'movie': _i11.MovieEndpoint()
        ..initialize(
          server,
          'movie',
          null,
        ),
      'order': _i12.OrderEndpoint()
        ..initialize(
          server,
          'order',
          null,
        ),
      'review': _i13.ReviewEndpoint()
        ..initialize(
          server,
          'review',
          null,
        ),
      'showtime': _i14.ShowtimeEndpoint()
        ..initialize(
          server,
          'showtime',
          null,
        ),
      'userProfile': _i15.UserProfileEndpoint()
        ..initialize(
          server,
          'userProfile',
          null,
        ),
    };
    connectors['adminCinema'] = _i1.EndpointConnector(
      name: 'adminCinema',
      endpoint: endpoints['adminCinema']!,
      methodConnectors: {
        'createCinema': _i1.MethodConnector(
          name: 'createCinema',
          params: {
            'cinema': _i1.ParameterDescription(
              name: 'cinema',
              type: _i1.getType<_i16.Cinema>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['adminCinema'] as _i2.AdminCinemaEndpoint)
                  .createCinema(
                    session,
                    params['cinema'],
                  ),
        ),
        'updateCinema': _i1.MethodConnector(
          name: 'updateCinema',
          params: {
            'cinema': _i1.ParameterDescription(
              name: 'cinema',
              type: _i1.getType<_i16.Cinema>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['adminCinema'] as _i2.AdminCinemaEndpoint)
                  .updateCinema(
                    session,
                    params['cinema'],
                  ),
        ),
        'deleteCinema': _i1.MethodConnector(
          name: 'deleteCinema',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['adminCinema'] as _i2.AdminCinemaEndpoint)
                  .deleteCinema(
                    session,
                    params['id'],
                  ),
        ),
        'createRoom': _i1.MethodConnector(
          name: 'createRoom',
          params: {
            'room': _i1.ParameterDescription(
              name: 'room',
              type: _i1.getType<_i17.Room>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['adminCinema'] as _i2.AdminCinemaEndpoint)
                  .createRoom(
                    session,
                    params['room'],
                  ),
        ),
        'deleteRoom': _i1.MethodConnector(
          name: 'deleteRoom',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['adminCinema'] as _i2.AdminCinemaEndpoint)
                  .deleteRoom(
                    session,
                    params['id'],
                  ),
        ),
      },
    );
    connectors['adminMovie'] = _i1.EndpointConnector(
      name: 'adminMovie',
      endpoint: endpoints['adminMovie']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'movie': _i1.ParameterDescription(
              name: 'movie',
              type: _i1.getType<_i18.Movie>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['adminMovie'] as _i3.AdminMovieEndpoint).create(
                    session,
                    params['movie'],
                  ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'movie': _i1.ParameterDescription(
              name: 'movie',
              type: _i1.getType<_i18.Movie>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['adminMovie'] as _i3.AdminMovieEndpoint).update(
                    session,
                    params['movie'],
                  ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['adminMovie'] as _i3.AdminMovieEndpoint).delete(
                    session,
                    params['id'],
                  ),
        ),
      },
    );
    connectors['adminShowtime'] = _i1.EndpointConnector(
      name: 'adminShowtime',
      endpoint: endpoints['adminShowtime']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'movieId': _i1.ParameterDescription(
              name: 'movieId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'roomId': _i1.ParameterDescription(
              name: 'roomId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'startTime': _i1.ParameterDescription(
              name: 'startTime',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'basePrice': _i1.ParameterDescription(
              name: 'basePrice',
              type: _i1.getType<double>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['adminShowtime'] as _i4.AdminShowtimeEndpoint)
                      .create(
                        session,
                        movieId: params['movieId'],
                        roomId: params['roomId'],
                        startTime: params['startTime'],
                        basePrice: params['basePrice'],
                      ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['adminShowtime'] as _i4.AdminShowtimeEndpoint)
                      .delete(
                        session,
                        params['id'],
                      ),
        ),
      },
    );
    connectors['emailIdp'] = _i1.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i5.EmailIdpEndpoint).login(
                session,
                email: params['email'],
                password: params['password'],
              ),
        ),
        'startRegistration': _i1.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i5.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _i1.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _i1.ParameterDescription(
              name: 'accountRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i5.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _i1.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _i1.ParameterDescription(
              name: 'registrationToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i5.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _i1.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i5.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _i1.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _i1.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i5.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _i1.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _i1.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i5.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _i1.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i5.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['googleIdp'] = _i1.EndpointConnector(
      name: 'googleIdp',
      endpoint: endpoints['googleIdp']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'idToken': _i1.ParameterDescription(
              name: 'idToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'accessToken': _i1.ParameterDescription(
              name: 'accessToken',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['googleIdp'] as _i6.GoogleIdpEndpoint).login(
                    session,
                    idToken: params['idToken'],
                    accessToken: params['accessToken'],
                  ),
        ),
        'hasAccount': _i1.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['googleIdp'] as _i6.GoogleIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['refreshJwtTokens'] = _i1.EndpointConnector(
      name: 'refreshJwtTokens',
      endpoint: endpoints['refreshJwtTokens']!,
      methodConnectors: {
        'refreshAccessToken': _i1.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _i1.ParameterDescription(
              name: 'refreshToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['refreshJwtTokens']
                          as _i7.RefreshJwtTokensEndpoint)
                      .refreshAccessToken(
                        session,
                        refreshToken: params['refreshToken'],
                      ),
        ),
      },
    );
    connectors['cinema'] = _i1.EndpointConnector(
      name: 'cinema',
      endpoint: endpoints['cinema']!,
      methodConnectors: {
        'getAll': _i1.MethodConnector(
          name: 'getAll',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['cinema'] as _i8.CinemaEndpoint).getAll(session),
        ),
        'getRoomWithSeats': _i1.MethodConnector(
          name: 'getRoomWithSeats',
          params: {
            'roomId': _i1.ParameterDescription(
              name: 'roomId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['cinema'] as _i8.CinemaEndpoint).getRoomWithSeats(
                    session,
                    params['roomId'],
                  ),
        ),
      },
    );
    connectors['concession'] = _i1.EndpointConnector(
      name: 'concession',
      endpoint: endpoints['concession']!,
      methodConnectors: {
        'getAll': _i1.MethodConnector(
          name: 'getAll',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['concession'] as _i9.ConcessionEndpoint)
                  .getAll(session),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['greeting'] as _i10.GreetingEndpoint).hello(
                session,
                params['name'],
              ),
        ),
      },
    );
    connectors['movie'] = _i1.EndpointConnector(
      name: 'movie',
      endpoint: endpoints['movie']!,
      methodConnectors: {
        'getAll': _i1.MethodConnector(
          name: 'getAll',
          params: {
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['movie'] as _i11.MovieEndpoint).getAll(
                session,
                status: params['status'],
              ),
        ),
        'getById': _i1.MethodConnector(
          name: 'getById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['movie'] as _i11.MovieEndpoint).getById(
                session,
                params['id'],
              ),
        ),
      },
    );
    connectors['order'] = _i1.EndpointConnector(
      name: 'order',
      endpoint: endpoints['order']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'showtimeId': _i1.ParameterDescription(
              name: 'showtimeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'showtimeSeatIds': _i1.ParameterDescription(
              name: 'showtimeSeatIds',
              type: _i1.getType<List<int>>(),
              nullable: false,
            ),
            'concessionQuantities': _i1.ParameterDescription(
              name: 'concessionQuantities',
              type: _i1.getType<Map<int, int>>(),
              nullable: false,
            ),
            'paymentMethod': _i1.ParameterDescription(
              name: 'paymentMethod',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['order'] as _i12.OrderEndpoint).create(
                session,
                showtimeId: params['showtimeId'],
                showtimeSeatIds: params['showtimeSeatIds'],
                concessionQuantities: params['concessionQuantities'],
                paymentMethod: params['paymentMethod'],
              ),
        ),
        'getById': _i1.MethodConnector(
          name: 'getById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['order'] as _i12.OrderEndpoint).getById(
                session,
                params['id'],
              ),
        ),
        'getMyOrders': _i1.MethodConnector(
          name: 'getMyOrders',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['order'] as _i12.OrderEndpoint).getMyOrders(
                session,
              ),
        ),
      },
    );
    connectors['review'] = _i1.EndpointConnector(
      name: 'review',
      endpoint: endpoints['review']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'movieId': _i1.ParameterDescription(
              name: 'movieId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'rating': _i1.ParameterDescription(
              name: 'rating',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'comment': _i1.ParameterDescription(
              name: 'comment',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['review'] as _i13.ReviewEndpoint).create(
                session,
                movieId: params['movieId'],
                rating: params['rating'],
                comment: params['comment'],
              ),
        ),
        'getByMovie': _i1.MethodConnector(
          name: 'getByMovie',
          params: {
            'movieId': _i1.ParameterDescription(
              name: 'movieId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['review'] as _i13.ReviewEndpoint).getByMovie(
                    session,
                    params['movieId'],
                  ),
        ),
      },
    );
    connectors['showtime'] = _i1.EndpointConnector(
      name: 'showtime',
      endpoint: endpoints['showtime']!,
      methodConnectors: {
        'getByCinemaAndMovie': _i1.MethodConnector(
          name: 'getByCinemaAndMovie',
          params: {
            'movieId': _i1.ParameterDescription(
              name: 'movieId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'date': _i1.ParameterDescription(
              name: 'date',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['showtime'] as _i14.ShowtimeEndpoint)
                  .getByCinemaAndMovie(
                    session,
                    movieId: params['movieId'],
                    date: params['date'],
                  ),
        ),
        'getSeats': _i1.MethodConnector(
          name: 'getSeats',
          params: {
            'showtimeId': _i1.ParameterDescription(
              name: 'showtimeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['showtime'] as _i14.ShowtimeEndpoint).getSeats(
                    session,
                    params['showtimeId'],
                  ),
        ),
        'holdSeats': _i1.MethodConnector(
          name: 'holdSeats',
          params: {
            'showtimeId': _i1.ParameterDescription(
              name: 'showtimeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'showtimeSeatIds': _i1.ParameterDescription(
              name: 'showtimeSeatIds',
              type: _i1.getType<List<int>>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['showtime'] as _i14.ShowtimeEndpoint).holdSeats(
                    session,
                    showtimeId: params['showtimeId'],
                    showtimeSeatIds: params['showtimeSeatIds'],
                  ),
        ),
        'releaseSeats': _i1.MethodConnector(
          name: 'releaseSeats',
          params: {
            'showtimeSeatIds': _i1.ParameterDescription(
              name: 'showtimeSeatIds',
              type: _i1.getType<List<int>>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['showtime'] as _i14.ShowtimeEndpoint).releaseSeats(
                    session,
                    showtimeSeatIds: params['showtimeSeatIds'],
                  ),
        ),
        'getById': _i1.MethodConnector(
          name: 'getById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['showtime'] as _i14.ShowtimeEndpoint).getById(
                    session,
                    params['id'],
                  ),
        ),
      },
    );
    connectors['userProfile'] = _i1.EndpointConnector(
      name: 'userProfile',
      endpoint: endpoints['userProfile']!,
      methodConnectors: {
        'getMe': _i1.MethodConnector(
          name: 'getMe',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['userProfile'] as _i15.UserProfileEndpoint)
                  .getMe(session),
        ),
        'updateMe': _i1.MethodConnector(
          name: 'updateMe',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'phone': _i1.ParameterDescription(
              name: 'phone',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'avatarUrl': _i1.ParameterDescription(
              name: 'avatarUrl',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['userProfile'] as _i15.UserProfileEndpoint)
                  .updateMe(
                    session,
                    name: params['name'],
                    email: params['email'],
                    phone: params['phone'],
                    avatarUrl: params['avatarUrl'],
                  ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i19.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i20.Endpoints()
      ..initializeEndpoints(server);
  }
}
