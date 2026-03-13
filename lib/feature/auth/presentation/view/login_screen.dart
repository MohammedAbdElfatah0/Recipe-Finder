import 'package:flutter/material.dart';
import 'package:recipe_finder/core/constant/image_manager.dart';
import 'package:recipe_finder/core/constant/string_manager.dart';
import 'package:recipe_finder/core/constant/style_manager.dart';
import 'package:recipe_finder/feature/auth/presentation/validation/validators.dart';

import '../../../../core/constant/color_manager.dart';
import '../widget/button.dart';
import '../widget/custom_text_form_field.dart';
import '../widget/divieder_contnue.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset(ImageManager.logo, height: 40, width: 40),
        ),
        title: Text(StringManager.appName, style: StyleManager.s18w700),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  ImageManager.loginBackground,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 24),
                Text(
                  StringManager.auth.welcomeBack,
                  style: StyleManager.s32w700,
                ),
                SizedBox(height: 8),
                Text(
                  StringManager.auth.signInToContinue,
                  style: StyleManager.s16w400.copyWith(
                    color: ColorManager.darkGreyColor,
                  ),
                ),
                SizedBox(height: 24),

                CustomTextFormFiledAuth(
                  emailController: emailController,
                  title: StringManager.auth.email,
                  subTitle: StringManager.auth.emailHint,
                  prefix: Icon(
                    Icons.email_outlined,
                    color: ColorManager.darkGreyColor,
                  ),
                  validator: Validators.email,
                ),
                SizedBox(height: 16),
                CustomTextFormFiledAuth(
                  emailController: passwordController,
                  title: StringManager.auth.password,
                  subTitle: StringManager.auth.passwordHint,
                  prefix: Icon(
                    Icons.lock_outlined,
                    color: ColorManager.darkGreyColor,
                  ),
                  isPassword: true,
                  validator: Validators.password,
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    StringManager.auth.forgotPassword,
                    style: StyleManager.s14w600.copyWith(
                      color: ColorManager.primary,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      StringManager.auth.login,
                      style: StyleManager.s18w700.copyWith(color:ColorManager.whiteColor),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                DiviederContinue(),
                SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: Button(
                        onPressed: () {},
                        title: StringManager.auth.google,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Button(
                        onPressed: () {},
                        title: StringManager.auth.apple,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringManager.auth.dontHaveAnAccount,
                      style: StyleManager.s14w500.copyWith(
                        color: ColorManager.darkGreyColor,
                      ),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        // Handle sign up action
                      },
                      child: Text(
                        StringManager.auth.signUp,
                        style: StyleManager.s14w600.copyWith(
                          color: ColorManager.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
