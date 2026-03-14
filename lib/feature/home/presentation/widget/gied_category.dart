import 'package:flutter/material.dart';
import 'package:recipe_finder/core/constant/color_manager.dart';
import 'package:recipe_finder/core/constant/image_manager.dart';
import 'package:recipe_finder/core/constant/style_manager.dart';

import '../../../../core/routes/app_routes.dart';

class GiedCategory extends StatelessWidget {
  const GiedCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () =>
              Navigator.pushNamed(context, Routes.category, arguments: 'Beef'),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: GridTile(
          footer: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: Text(
              'Beef',
              style: StyleManager.s14w700.copyWith(
                color: ColorManager.whiteColor,
              ),
            ),
          ),
          child: Image.asset(ImageManager.loginBackground, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
