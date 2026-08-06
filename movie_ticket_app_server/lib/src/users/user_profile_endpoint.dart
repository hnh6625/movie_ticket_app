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
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw Exception('User not authenticated');
    }

    final profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userIdentifier.equals(authInfo.userIdentifier),
    );

    if (profile == null) {
      throw Exception('User profile not found');
    }

    final updated = profile.copyWith(
      name: name,
      email: email,
      phone: phone,
      avatarUrl: avatarUrl,
    );

    return await UserProfile.db.updateRow(session, updated);
  }

  Future<UserProfile> createMe(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw Exception('User not authenticated');
    }

    final existing = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userIdentifier.equals(authInfo.userIdentifier),
    );

    if (existing != null) {
      return existing;
    }

    final profile = UserProfile(
      userIdentifier: authInfo.userIdentifier,
      email: '',
      name: '',
      role: 'USER',
      createdAt: DateTime.now(),
    );

    return await UserProfile.db.insertRow(session, profile);
  }
}