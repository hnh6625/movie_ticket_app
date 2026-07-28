import '../generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class UserProfileEndpoint extends Endpoint {
  Future<UserProfile?> getMe(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) return null;

    return UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userIdentifier.equals(authInfo.userIdentifier),
    );
  }

  Future<UserProfile> updateMe(
      Session session, {
        required String name,
        String? phone,
        String? avatarUrl,
      }) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw Exception('User not authenticated');
    }

    final existing = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userIdentifier.equals(authInfo.userIdentifier),
    );

    if (existing != null) {
      final updated = existing.copyWith(name: name, phone: phone, avatarUrl: avatarUrl);
      return UserProfile.db.updateRow(session, updated);
    } else {
      final newProfile = UserProfile(
        userIdentifier: authInfo.userIdentifier,
        name: name,
        phone: phone,
        avatarUrl: avatarUrl,
        role: 'USER',
        createdAt: DateTime.now(),
      );
      return UserProfile.db.insertRow(session, newProfile);
    }
  }
}