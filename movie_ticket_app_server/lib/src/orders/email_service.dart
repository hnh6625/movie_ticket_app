import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:serverpod/serverpod.dart' hide Order, Message;
import '../generated/protocol.dart';

/// Hàm gửi email dùng chung — tái sử dụng cho cả vé điện tử lẫn mã xác thực đăng ký/quên mật khẩu.
Future<void> sendPlainEmail(
    Session session, {
      required String toEmail,
      required String subject,
      required String body,
    }) async {
  final gmailAddress = session.passwords['gmailAddress'];
  final gmailAppPassword = session.passwords['gmailAppPassword'];

  if (gmailAddress == null || gmailAppPassword == null) {
    session.log(
      'Chưa cấu hình gmailAddress/gmailAppPassword trong passwords.yaml, không thể gửi email tới $toEmail',
      level: LogLevel.warning,
    );
    return;
  }

  final smtpServer = gmail(gmailAddress, gmailAppPassword);

  final message = Message()
    ..from = Address(gmailAddress, 'Movie Ticket App')
    ..recipients.add(toEmail)
    ..subject = subject
    ..text = body;

  try {
    await send(message, smtpServer);
  } catch (e) {
    session.log('Gửi email tới $toEmail thất bại: $e', level: LogLevel.error);
  }
}

Future<void> sendTicketEmail(Session session, Order order, String toEmail) async {
  await sendPlainEmail(
    session,
    toEmail: toEmail,
    subject: 'Vé điện tử của bạn - Đơn hàng #${order.id}',
    body: '''
Cảm ơn bạn đã đặt vé!

Mã vé: ${order.qrCodeData}
Tổng tiền: ${order.totalPrice.toStringAsFixed(0)} VNĐ
Trạng thái: ${order.status}

Vui lòng xuất trình mã vé này tại rạp.
''',
  );
}