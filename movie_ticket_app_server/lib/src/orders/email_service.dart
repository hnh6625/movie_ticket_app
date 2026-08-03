import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:serverpod/serverpod.dart' hide Order, Message;
import '../generated/protocol.dart';

Future<void> sendTicketEmail(Session session, Order order, String toEmail) async {
  // Dùng Gmail SMTP để test — cần bật "App Password" trong tài khoản Gmail
  // (không dùng mật khẩu Gmail thường vì Google chặn đăng nhập kém an toàn)
  final smtpServer = gmail(
    session.passwords['gmailAddress']!,
    session.passwords['gmailAppPassword']!,
  );

  final message = Message()
    ..from = Address(session.passwords['gmailAddress']!, 'Movie Ticket App')
    ..recipients.add(toEmail)
    ..subject = 'Vé điện tử của bạn - Đơn hàng #${order.id}'
    ..text = '''
Cảm ơn bạn đã đặt vé!

Mã vé: ${order.qrCodeData}
Tổng tiền: ${order.totalPrice.toStringAsFixed(0)} VNĐ
Trạng thái: ${order.status}

Vui lòng xuất trình mã vé này tại rạp.
''';

  try {
    await send(message, smtpServer);
  } catch (e) {
    session.log('Gửi email thất bại: $e', level: LogLevel.error);
  }
}