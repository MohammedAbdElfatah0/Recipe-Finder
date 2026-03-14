import 'package:flutter/material.dart';

import '../../../../core/constant/color_manager.dart';
import '../../../../core/constant/image_manager.dart';
import '../../../../core/constant/style_manager.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
            child: Image.asset(
              ImageManager.loginBackground,
              fit: BoxFit.cover,
              height: 180,
            ),
          ),
          SizedBox(height: 12),
          InfoItemCategory(),
        ],
      ),
    );
  }
}

class InfoItemCategory extends StatelessWidget {
  const InfoItemCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Herb Roasted Chicken',
            style: StyleManager.s14w600,
            maxLines: 2,
          ),
          SizedBox(height: 7),
          Row(
            children: [
              Icon(
                Icons.access_time_sharp,
                size: 21,
                color: ColorManager.darkGreyColor,
              ),
              SizedBox(width: 4),
              Text(
                '55 mins',
                style: StyleManager.s11w500.copyWith(
                  color: ColorManager.darkGreyColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
