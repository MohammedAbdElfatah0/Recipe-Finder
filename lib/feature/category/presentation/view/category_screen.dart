import 'package:flutter/material.dart';
import 'package:recipe_finder/core/constant/color_manager.dart';
import 'package:recipe_finder/core/constant/style_manager.dart';

import '../widget/item_category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_outlined,
            size: 26,
            color: ColorManager.primary,
          ),
        ),
        title: Text(title, style: StyleManager.s18w700),
        //todo search
        actionsPadding: EdgeInsets.symmetric(horizontal: 16),
        actions: [Icon(Icons.search, size: 26, color: ColorManager.greyColor)],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8.5,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) => ItemCategory(),
        ),
      ),
    );
  }
}
