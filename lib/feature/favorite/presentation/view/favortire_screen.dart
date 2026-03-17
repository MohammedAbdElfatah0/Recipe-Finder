import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/core/constant/color_manager.dart';
import 'package:recipe_finder/core/constant/style_manager.dart';
import 'package:recipe_finder/core/routes/app_routes.dart';

import '../cubit/favorite_cubit.dart';
import '../widget/info_favorite_item.dart';

class FavortireScreen extends StatelessWidget {
  const FavortireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit()..loadedFavorite(),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 32),
            child: BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                log('FavoriteState: ${state.runtimeType}');
                switch (state) {
                  case FavoriteInitial():
                    return const Center(child: CircularProgressIndicator());

                  case FavoriteSuccess():
                    if (state.favorites.isEmpty) {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.heart_broken_outlined,
                              size: 38,
                              color: ColorManager.primary,
                            ),
                            Text(
                              'No favorites yet',
                              style: StyleManager.s18w700,
                            ),
                          ],
                        ),
                      );
                    }

                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.99,
                          ),
                      itemCount: state.favorites.length,
                      itemBuilder: (context, index) {
                        final favorite = state.favorites[index];

                        return GestureDetector(
                          onTap:
                              () => Navigator.pushNamed(
                                context,
                                Routes.categoryDetails,
                                arguments: favorite.id,
                              ),
                          child: InfoFavoriteItem(favoriteModel: favorite),
                        );
                      },
                    );
                  case FavoriteError():
                    return Center(
                      child: Text(
                        'Error: ${state.message}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
