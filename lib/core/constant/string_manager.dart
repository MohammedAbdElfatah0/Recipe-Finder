class StringManager {
  static final auth = AuthStringManager();
  static final profile = Profile();
  static const String appName = 'Recipe Finder';
  static const String category = 'Categories';
  static const String seeAll = 'See All';
}

class AuthStringManager {
  final String fullName = 'Full Name';
  final String email = 'Email';
  final String password = 'Password';
  final String forgotPassword = 'Forgot Password?';
  final String login = 'Login';
  final String createAccount = 'Create Account';
  final String signUp = 'Sign Up';
  final String logout = 'Logout';
  final String apple = 'Apple';
  final String google = 'Google';

  final String fullNameHint = 'Enter your full name';
  final String emailHint = 'Enter your email';
  final String passwordHint = 'Enter your password';

  final String welcomeBack = 'Welcome Back';
  final String alreadyHaveAnAccount = 'Already have an account?';
  final String dontHaveAnAccount = "Don't have an account?";
  final String joinCommunity = 'Join our community of food lovers';
  final String signInToContinue = 'Sign in to continue your culinary journey';

  final String orSignUpWith = 'Or sign up with';
  final String orLoginWith = 'Or continue with';
}

class Profile {
  final String account = 'Account';
  final String support = 'Support';
  final String prefernce = 'Prefernce';

  final String editProfile = 'Edit Profile';
  final String changePassword = 'Change Password';
  final String notificationSetting = 'Notifiaction Setting';
  final String darkMode = 'Dark Mode';
  final String languages = 'Languages';
  final String helpCenter = 'Help Center';
  final String privacyPollicy = 'Privacy Pollicy';
  final String termsOfSerice = 'Terms of Service';
}
