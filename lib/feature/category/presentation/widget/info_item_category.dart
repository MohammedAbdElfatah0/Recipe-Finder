import 'package:flutter/material.dart';

import '../../../../core/constant/style_manager.dart';

class InfoItemCategory extends StatelessWidget {
  const InfoItemCategory({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(categoryName, style: StyleManager.s14w600, maxLines: 2),
          SizedBox(height: 7),
        ],
      ),
    );
  }
}
