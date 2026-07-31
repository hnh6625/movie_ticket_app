import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class ReleaseSeatFutureCall extends FutureCall<ShowtimeSeatReleasePayload> {
  @override
  Future<void> invoke(Session session, ShowtimeSeatReleasePayload? object) async {
    if (object == null) return;

    final seat = await ShowtimeSeat.db.findById(session, object.showtimeSeatId);
    if (seat == null) return;

    if (seat.status == 'HELD' &&
        seat.holdExpiredAt != null &&
        !seat.holdExpiredAt!.isAfter(DateTime.now())) {
      final updated = seat.copyWith(
        status: 'AVAILABLE',
        heldByUserId: null,
        holdExpiredAt: null,
      );
      await ShowtimeSeat.db.updateRow(session, updated);
    }
  }
}