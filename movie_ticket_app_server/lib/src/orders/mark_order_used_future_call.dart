import 'package:serverpod/serverpod.dart' hide Order;
import '../generated/protocol.dart';

class MarkOrderUsedFutureCall extends FutureCall<OrderUsedPayload> {
  @override
  Future<void> invoke(Session session, OrderUsedPayload? object) async {
    if (object == null) return;

    final order = await Order.db.findById(session, object.orderId);
    if (order == null) return;

    if (order.status == 'PAID') {
      final updated = order.copyWith(status: 'USED');
      await Order.db.updateRow(session, updated);
    }
  }
}