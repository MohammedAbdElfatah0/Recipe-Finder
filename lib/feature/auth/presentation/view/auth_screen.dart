import 'package:flutter/material.dart';
import 'package:recipe_finder/feature/auth/presentation/view/login_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //todo :: when add home screen feature when check user is logged in or not if logged in then return home screen else login screen
    return LoginScreen();
  }
}