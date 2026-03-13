import 'package:flutter/material.dart';
import 'package:recipe_finder/core/constant/color_manager.dart';
import 'package:recipe_finder/core/constant/style_manager.dart';

class Message {
  static void showSuccessMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: StyleManager.s16w600),
        backgroundColor: ColorManager.successColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.5),
        ),
        duration: Duration(milliseconds: 4000),
      ),
    );
  }

  static void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: StyleManager.s16w600),
        backgroundColor: ColorManager.errorColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.5),
        ),
        duration: Duration(milliseconds: 4000),
      ),
    );
  }

  static void showWarningMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: StyleManager.s16w600),
        backgroundColor: ColorManager.warningColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.5),
        ),
        duration: Duration(milliseconds: 4000),
      ),
    );
  }
}
