import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_finder/core/constant/color_manager.dart';
import 'package:recipe_finder/core/constant/style_manager.dart';
import 'package:recipe_finder/feature/home/data/model/category_model.dart';

import '../../../../core/routes/app_routes.dart';

class GiedCategory extends StatelessWidget {
  final CategoryModel category;
  const GiedCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.pushNamed(
            context,
            Routes.category,
            arguments: category.strCategory,
          ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: GridTile(
          footer: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: Text(
              category.strCategory,
              style: StyleManager.s14w700.copyWith(
                color: ColorManager.blackColor,
              ),
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: category.strCategoryThumb,
            fit: BoxFit.cover,
            placeholder:
                (context, url) => Center(
                  child: CircularProgressIndicator(color: ColorManager.primary),
                ),
            errorWidget:
                (context, url, error) => Icon(
                  Icons.broken_image_rounded,
                  color: ColorManager.whiteColor,
                ),
          ),
        ),
      ),
    );
  }
}
