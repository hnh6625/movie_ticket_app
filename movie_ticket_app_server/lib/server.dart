import 'dart:async' show unawaited;
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import 'package:serverpod_auth_idp_server/providers/google.dart';

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';
import 'src/seed/seed_data.dart';
import 'src/showtimes/release_seat_future_call.dart';
import 'src/orders/mark_order_used_future_call.dart';
import 'src/orders/email_service.dart';

void run(List<String> args) async {
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
  );

  pod.registerFutureCall(ReleaseSeatFutureCall(), 'releaseSeat');
  pod.registerFutureCall(MarkOrderUsedFutureCall(), 'markOrderUsed');

  pod.initializeAuthServices(
    tokenManagerBuilders: [
      JwtConfigFromPasswords(),
    ],
    identityProviderBuilders: [
      EmailIdpConfigFromPasswords(
        sendRegistrationVerificationCode: _sendRegistrationCode,
        sendPasswordResetVerificationCode: _sendPasswordResetCode,
      ),
      GoogleIdpConfigFromPasswords(),
    ],
  );

  await pod.start();

  final internalSession = await pod.createSession();
  await seedMovies(internalSession);
  await seedCinemasAndSeats(internalSession);
  await seedShowtimes(internalSession);
  await seedConcessions(internalSession);
  await internalSession.close();


}

void _sendRegistrationCode(
    Session session, {
      required String email,
      required UuidValue accountRequestId,
      required String verificationCode,
      required Transaction? transaction,
    }) {
  session.log('[EmailIdp] Registration code ($email): $verificationCode');
  unawaited(sendPlainEmail(
    session,
    toEmail: email,
    subject: 'Mã xác thực đăng ký - Movie Ticket App',
    body: 'Mã xác thực đăng ký tài khoản của bạn là: $verificationCode\n\n'
        'Vui lòng không chia sẻ mã này cho bất kỳ ai.',
  ));
}

void _sendPasswordResetCode(
    Session session, {
      required String email,
      required UuidValue passwordResetRequestId,
      required String verificationCode,
      required Transaction? transaction,
    }) {
  session.log('[EmailIdp] Password reset code ($email): $verificationCode');
  unawaited(sendPlainEmail(
    session,
    toEmail: email,
    subject: 'Mã đặt lại mật khẩu - Movie Ticket App',
    body: 'Mã đặt lại mật khẩu của bạn là: $verificationCode\n\n'
        'Vui lòng không chia sẻ mã này cho bất kỳ ai.',
  ));
}