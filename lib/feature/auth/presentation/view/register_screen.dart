import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/core/widget/message.dart';
import 'package:recipe_finder/feature/auth/data/repo/auth_repo.dart';

import '../../../../core/constant/color_manager.dart';
import '../../../../core/constant/image_manager.dart';
import '../../../../core/constant/string_manager.dart';
import '../../../../core/constant/style_manager.dart';
import '../../../../core/widget/loading_indicator.dart';
import '../cubit/register/register_cubit.dart';
import '../validation/validators.dart';
import '../widget/button.dart';
import '../widget/custom_text_form_field.dart';
import '../widget/divieder_contnue.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(AuthRepo()),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        ImageManager.logo,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Center(
                      child: Text(
                        StringManager.auth.createAccount,
                        style: StyleManager.s32w700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Center(
                      child: Text(
                        StringManager.auth.joinCommunity,
                        style: StyleManager.s16w400.copyWith(
                          color: ColorManager.darkGreyColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    CustomTextFormFiledAuth(
                      controller: fullNameController,
                      title: StringManager.auth.fullName,
                      subTitle: StringManager.auth.fullNameHint,
                      prefix: Icon(
                        Icons.person_outline,
                        color: ColorManager.darkGreyColor,
                      ),
                      validator: Validators.fullName,
                    ),
                    SizedBox(height: 16),
                    CustomTextFormFiledAuth(
                      controller: emailController,
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
                      controller: passwordController,
                      title: StringManager.auth.password,
                      subTitle: StringManager.auth.passwordHint,
                      prefix: Icon(
                        Icons.lock_outlined,
                        color: ColorManager.darkGreyColor,
                      ),
                      isPassword: true,
                      validator: Validators.password,
                    ),
                    SizedBox(height: 16),
                    BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterSuccess) {
                          Message.showSuccessMessage(
                            context,
                            'Registration successful!',
                          );
                          Navigator.pop(context);
                        } else if (state is RegisterFailure) {
                          Message.showErrorMessage(context, state.message);
                        }
                      },
                      builder: (context, state) {
                        return Column(
                          children: [
                            if (state is RegisterFailure)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  state.message,
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            SizedBox(
                              width: double.infinity,
                              child:
                                  state is RegisterLoading
                                      ? const LoadingIndicator()
                                      : ElevatedButton(
                                        onPressed: () {
                                          //check validation
                                          if (_formKey.currentState!
                                              .validate()) {
                                            context
                                                .read<RegisterCubit>()
                                                .register(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                  fullName:
                                                      fullNameController.text,
                                                );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: ColorManager.primary,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 16,
                                          ),
                                        ),
                                        child: Text(
                                          StringManager.auth.signUp,
                                          style: StyleManager.s18w700.copyWith(
                                            color: ColorManager.whiteColor,
                                          ),
                                        ),
                                      ),
                            ),
                          ],
                        );
                      },
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
                          StringManager.auth.alreadyHaveAnAccount,
                          style: StyleManager.s14w500.copyWith(
                            color: ColorManager.darkGreyColor,
                          ),
                        ),
                        SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            StringManager.auth.login,
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
        ),
      ),
    );
  }
}
