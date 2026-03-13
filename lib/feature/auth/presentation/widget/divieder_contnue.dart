import 'package:flutter/material.dart';

import '../../../../core/constant/color_manager.dart';
import '../../../../core/constant/style_manager.dart';

class DiviederContinue extends StatelessWidget {
  const DiviederContinue({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: Colors.black, thickness: 1, endIndent: 5),
        ),
        Text(
          'or continue with',
          style: StyleManager.s14w500.copyWith(color: ColorManager.darkGreyColor),
        ),
        const Expanded(
          child: Divider(color: Colors.black, thickness: 1, indent: 5),
        ),
      ],
    );
  }
}
