import 'package:flutter/material.dart';
import 'package:recipe_finder/feature/category/presentation/view/category_details_screen.dart';
import 'package:recipe_finder/feature/category/presentation/view/category_screen.dart';

import '../../feature/auth/presentation/view/auth_screen.dart';
import '../../feature/auth/presentation/view/login_screen.dart';
import '../../feature/auth/presentation/view/register_screen.dart';
import '../../feature/home/presentation/view/home_screen.dart';
import '../../feature/layout/presentation/view/layout.dart';
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
      case Routes.layoutRoute:
        return MaterialPageRoute(builder: (_) => const LayoutScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.category:
        String title = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => CategoryScreen(title: title));
      case Routes.categoryDetails:
        final id = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => CategoryDetailsScreen(mealId: id),
        );
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
