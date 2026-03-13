import 'package:flutter/material.dart';

import '../../../../core/constant/style_manager.dart';
import '../../../../core/widget/custom_text_form_field.dart';

class CustomTextFormFiledAuth extends StatelessWidget {
  const CustomTextFormFiledAuth({
    super.key,
    required this.emailController,
    required this.title,
    this.isPassword = false, required this.subTitle, this.validator, this.prefix,
  });

  final TextEditingController emailController;

  final String title;
  final String subTitle;
  final String? Function(String?)? validator;
  final bool isPassword;
  final Widget? prefix;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: StyleManager.s14w600),
        SizedBox(height: 16),
        CustomTextFormField(
          controller: emailController,
          hintText: subTitle,
          prefix: prefix,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            // Simple email validation
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
          isPassword: isPassword,
        ),
      ],
    );
  }
}
