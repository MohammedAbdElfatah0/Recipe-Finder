import 'package:flutter/material.dart';

import '../../../../core/constant/style_manager.dart';
import '../../../../core/widget/custom_text_form_field.dart';

class CustomTextFormFiledAuth extends StatelessWidget {
  const CustomTextFormFiledAuth({
    super.key,
    required this.controller,
    required this.title,
    this.isPassword = false,
    required this.subTitle,
    this.validator,
    this.prefix,
  });

  final TextEditingController controller;

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
          controller: controller,
          hintText: subTitle,
          prefix: prefix,
          validator: validator,
          isPassword: isPassword,
        ),
      ],
    );
  }
}
