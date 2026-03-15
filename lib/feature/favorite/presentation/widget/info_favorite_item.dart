import 'package:flutter/material.dart';

import '../../../../core/constant/color_manager.dart';
import '../../../../core/constant/image_manager.dart';
import '../../../../core/constant/style_manager.dart';

class InfoFavoriteItem extends StatelessWidget {
  const InfoFavoriteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                //image as saving form network
                child: Image.asset(
                  ImageManager.loginBackground,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentGeometry.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CircleAvatar(
                    backgroundColor: ColorManager.whiteColor.withValues(
                      alpha: 0.8,
                    ),
                    child: Icon(Icons.favorite, color: ColorManager.primary),
                  ),
                ),
              ),
            ],
          ),
          //title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
            child: Text('FOOD Title ', style: StyleManager.s14w700),
          ),
        ],
      ),
    );
  }
}
