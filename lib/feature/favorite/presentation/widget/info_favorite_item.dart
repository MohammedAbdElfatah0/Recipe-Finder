import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/core/constant/color_manager.dart';

import '../../data/model/favorite_model.dart';
import '../cubit/favorite_cubit.dart';

class InfoFavoriteItem extends StatefulWidget {
  const InfoFavoriteItem({super.key, required this.favoriteModel});

  final FavoriteModel favoriteModel;

  @override
  State<InfoFavoriteItem> createState() => _InfoFavoriteItemState();
}

class _InfoFavoriteItemState extends State<InfoFavoriteItem>
    with SingleTickerProviderStateMixin {
  bool _isRemoved = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),

      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: FadeTransition(opacity: animation, child: child),
        );
      },

      child:
          _isRemoved
              ? const SizedBox()
              : Card(
                color: ColorManager.whiteColor,
                key: ValueKey(widget.favoriteModel.id),
                child: _buildCard(context),
              ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: widget.favoriteModel.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),

              GestureDetector(
                onTap: () {
                  setState(() {
                    _isRemoved = true;
                  });

                  Future.delayed(const Duration(milliseconds: 400), () {
                    context.read<FavoriteCubit>().toggleFavorite(
                      widget.favoriteModel,
                    );
                  });
                },

                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: CircleAvatar(
                    backgroundColor: ColorManager.whiteColor,
                    child: Icon(Icons.favorite, color: ColorManager.primary),
                  ),
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(widget.favoriteModel.title),
        ),
      ],
    );
  }
}
