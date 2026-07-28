import '../generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ConcessionEndpoint extends Endpoint {
  Future<List<Concession>> getAll(Session session) async {
    return Concession.db.find(session);
  }
}