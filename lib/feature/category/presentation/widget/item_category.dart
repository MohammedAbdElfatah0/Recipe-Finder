import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_finder/feature/category/data/model/meals_model.dart';

import '../../../../core/constant/color_manager.dart';
import '../../../../core/routes/app_routes.dart';
import 'info_item_category.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({super.key, required this.meal});
  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.pushNamed(
            context,
            Routes.categoryDetails,
            arguments: meal.idMeal,
          ),
      child: Card(
        color: ColorManager.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        elevation: 8,
        shadowColor: ColorManager.blackColor.withAlpha(51),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: CachedNetworkImage(
                imageUrl: meal.strMealThumb,
                fit: BoxFit.cover,
                height: 180,
                placeholder:
                    (context, url) =>
                        Center(child: CircularProgressIndicator()),
                errorWidget:
                    (context, url, error) => Center(child: Icon(Icons.error)),
              ),
            ),
            SizedBox(height: 12),
            InfoItemCategory(categoryName: meal.strMeal),
          ],
        ),
      ),
    );
  }
}
