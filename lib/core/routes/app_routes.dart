import 'package:flutter/material.dart';

import '../../feature/auth/presentation/view/auth_screen.dart';
import '../../feature/auth/presentation/view/login_screen.dart';
import '../../feature/auth/presentation/view/register_screen.dart';
part 'routes.dart';

class AppRoutes {
  Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.authRoute:
        return MaterialPageRoute(builder: (_) => AuthScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      // case Routes.homeRoute:
      //   return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
