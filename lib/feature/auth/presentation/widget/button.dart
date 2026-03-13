import 'package:flutter/material.dart';
import 'package:recipe_finder/core/constant/color_manager.dart';
import 'package:recipe_finder/core/constant/style_manager.dart';

class Button extends StatelessWidget {
  const Button({super.key,required this.onPressed, required this.title});

  final String title;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: ColorManager.whiteColor,
          // shadowColor: Colors.transparent,
          // foregroundColor: ColorManager.whiteColor,
          overlayColor: ColorManager.whiteColor,

          padding: const EdgeInsets.symmetric(vertical: 16),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide(color: ColorManager.greyColor),
          ),
        ),
        onPressed: onPressed,
        child: Text(title, style: StyleManager.s16w600),
      ),
    );
  }
}
