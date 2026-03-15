import 'package:flutter/material.dart';
import 'package:recipe_finder/core/routes/app_routes.dart';

import '../widget/info_favorite_item.dart';

class FavortireScreen extends StatelessWidget {
  const FavortireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 32),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.99,
            ),
            itemBuilder:
                (context, index) => GestureDetector(
                  onTap:
                      () => Navigator.pushNamed(
                        context,
                        Routes.categoryDetails,
                        arguments: 1,
                      ),
                  child: InfoFavoriteItem(),
                ),
          ),
        ),
      ),
    );
  }
}
