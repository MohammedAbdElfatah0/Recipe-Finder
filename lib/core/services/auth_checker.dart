import 'package:recipe_finder/core/services/shared_prefs_service.dart';

class AuthChecker {
  /// Check if user is logged in
  static Future<bool> isLoggedIn() async {
    return await SharedPrefsService.isLoggedIn();
  }

  /// Get current user info from storage
  static Future<Map<String, String>?> getCurrentUserInfo() async {
    final isLoggedIn = await SharedPrefsService.isLoggedIn();
    if (!isLoggedIn) return null;

    final email = await SharedPrefsService.getUserEmail();
    final name = await SharedPrefsService.getUserName();

    if (email != null) {
      return {
        'email': email,
        'name': name ?? 'User',
      };
    }

    return null;
  }

  /// Clear all auth data (for complete logout)
  static Future<void> clearAuthData() async {
    await SharedPrefsService.clearLoginState();
  }
}
