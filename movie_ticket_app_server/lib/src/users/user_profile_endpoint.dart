import '../generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart' as auth_core;

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

    // Serverpod's built-in auth module already knows the email (and, for
    // some providers, the full name) that the user registered with.
    // Pull it in so the app profile is not created empty.
    final auth_core.UserProfileModel? builtInProfile = await authInfo.userProfile(session);

    final profileEmail = builtInProfile?.email ?? '';
    final profileName = builtInProfile?.fullName ?? builtInProfile?.userName ?? '';

    final profile = UserProfile(
      userIdentifier: authInfo.userIdentifier,
      email: profileEmail,
      name: profileName,
      role: 'USER',
      createdAt: DateTime.now(),
    );

    return await UserProfile.db.insertRow(session, profile);
  }
}