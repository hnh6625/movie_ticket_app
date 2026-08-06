import '../generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

bool _isValidEmail(String email) {
  final regex = RegExp(r'^[\w\.\-]+@[\w\-]+\.[a-zA-Z]{2,}$');
  return regex.hasMatch(email);
}

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
        required String email,
        String? phone,
        String? avatarUrl,
      }) async {
    if (!_isValidEmail(email)) {
      throw Exception('Email không đúng định dạng');
    }

    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw Exception('User not authenticated');
    }

    final existing = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userIdentifier.equals(authInfo.userIdentifier),
    );

    if (existing != null) {
      final updated = existing.copyWith(
        name: name,
        email: email,
        phone: phone,
        avatarUrl: avatarUrl,
      );
      return UserProfile.db.updateRow(session, updated);
    } else {
      final newProfile = UserProfile(
        userIdentifier: authInfo.userIdentifier,
        email: email,
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