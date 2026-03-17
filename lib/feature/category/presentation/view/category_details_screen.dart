import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/core/constant/image_manager.dart';
import 'package:recipe_finder/core/network/dio_service.dart';
import 'package:recipe_finder/feature/category/data/repo/category_repo.dart';
import 'package:recipe_finder/feature/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:recipe_finder/feature/favorite/data/model/favorite_model.dart';

import '../cubit/meals_details/meals_details_cubit.dart';
import '../widget/info_item.dart';
import '../widget/ingredient_item.dart';
import '../widget/instruction_item.dart';
import '../widget/tag.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key, required this.mealId});

  /// Pass the meal ID from the previous screen (list or favourites).
  final String mealId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  MealsDetailsCubit(CategoryRepo(DioService()))
                    ..getMeals(mealId),
        ),
        BlocProvider(create: (context) => FavoriteCubit()..loadedFavorite()),
      ],
      child: const _CategoryDetailsView(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Private stateful view — owns only the ingredient check-list state
// ─────────────────────────────────────────────────────────────────────────────
class _CategoryDetailsView extends StatefulWidget {
  const _CategoryDetailsView();

  @override
  State<_CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<_CategoryDetailsView> {
  static const _primaryColor = Color(0xFFFF6B4A);

  /// Checked state for each ingredient — rebuilt when we know the count.
  List<bool> _checked = [];

  void _initChecked(int count) {
    if (_checked.length != count) {
      _checked = List.filled(count, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<MealsDetailsCubit, MealsDetailsState>(
        builder: (context, state) {
          // ── Loading ────────────────────────────────────────────────────────
          if (state is MealsDetailsLoading || state is MealsDetailsInitial) {
            return const Center(
              child: CircularProgressIndicator(color: _primaryColor),
            );
          }

          // ── Error ──────────────────────────────────────────────────────────
          if (state is MealsDetailsError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 56,
                    color: _primaryColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed:
                        () => context.read<MealsDetailsCubit>().getMeals(
                          (context.widget as CategoryDetailsScreen).mealId,
                        ),
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          // ── Success ────────────────────────────────────────────────────────
          if (state is MealsDetailsSuccess) {
            // Guard: API may return an empty list
            if (state.meals.isEmpty) {
              return const Center(child: Text('No meal data found.'));
            }

            final meal = state.meals.first;

            // Zip ingredient names + measures into display strings
            final ingredients = List.generate(meal.ingredients.length, (i) {
              final measure =
                  meal.measures.length > i ? meal.measures[i].trim() : '';
              return measure.isEmpty
                  ? meal.ingredients[i]
                  : '$measure ${meal.ingredients[i]}';
            });

            // Initialise / resize the checked-list without re-triggering build
            _initChecked(ingredients.length);

            // Split instructions into numbered steps on newline boundaries
            final steps =
                meal.instructions
                    .split('\n')
                    .map((s) => s.trim())
                    .where((s) => s.isNotEmpty)
                    .toList();

            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    // ── Hero image app-bar ──────────────────────────────────
                    SliverAppBar(
                      expandedHeight: MediaQuery.of(context).size.height * 0.4,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      leadingWidth: 70,
                      leading: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, top: 8),
                          child: CircleAvatar(
                            backgroundColor: Colors.white.withValues(
                              alpha: 0.9,
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      actions: [
                        BlocBuilder<FavoriteCubit, FavoriteState>(
                          builder: (context, favoriteState) {
                            bool isFavorited = false;

                            if (favoriteState is FavoriteSuccess) {
                              isFavorited = context
                                  .read<FavoriteCubit>()
                                  .isFavorite(meal.idMeal);
                            }

                            return GestureDetector(
                              onTap: () {
                                final favoriteModel = FavoriteModel(
                                  id: meal.idMeal,
                                  title: meal.strMeal,
                                  image: meal.thumbnail,
                                  isFavorite: true,
                                );
                                context.read<FavoriteCubit>().toggleFavorite(
                                  favoriteModel,
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  right: 16,
                                  top: 8,
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white.withValues(
                                    alpha: 0.9,
                                  ),
                                  child: Icon(
                                    isFavorited
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color:
                                        isFavorited
                                            ? Colors.red
                                            : _primaryColor,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          fit: StackFit.expand,
                          children: [
                            // Meal thumbnail from API; fallback to local asset
                            meal.thumbnail.isNotEmpty
                                ? Image.network(
                                  meal.thumbnail,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (_, __, ___) => Image.asset(
                                        ImageManager.loginBackground,
                                        fit: BoxFit.cover,
                                      ),
                                )
                                : Image.asset(
                                  ImageManager.loginBackground,
                                  fit: BoxFit.cover,
                                ),
                            // Curved white overlay
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 36,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ── Scrollable content ──────────────────────────────────
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          24,
                          10,
                          24,
                          75 + 20 + bottomPadding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Tags — category + area from API
                            Row(
                              children: [
                                if (meal.category != null)
                                  Tag(
                                    text: meal.category!.toUpperCase(),
                                    color: _primaryColor,
                                  ),
                                if (meal.category != null && meal.area != null)
                                  const SizedBox(width: 12),
                                if (meal.area != null)
                                  Tag(
                                    text: meal.area!.toUpperCase(),
                                    color: const Color.fromARGB(
                                      255,
                                      88,
                                      85,
                                      85,
                                    ),
                                    isGrey: true,
                                  ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            // Meal name
                            Text(
                              meal.strMeal,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 25),

                            // Info row — ingredient count, steps count, area
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: InfoItem(
                                    icon: Icons.list_alt_rounded,
                                    text: '${ingredients.length} Ingredients',
                                    color: _primaryColor,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: InfoItem(
                                    icon: Icons.format_list_numbered_rounded,
                                    text: '${steps.length} Steps',
                                    color: _primaryColor,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: InfoItem(
                                    icon: Icons.public_rounded,
                                    text: meal.area ?? 'World',
                                    color: _primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 35),

                            // ── Ingredients ─────────────────────────────────
                            const Text(
                              'Ingredients',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ...ingredients.asMap().entries.map(
                              (e) => IngredientItem(
                                text: e.value,
                                color: _primaryColor,
                                isChecked: _checked[e.key],
                                onTap:
                                    () => setState(
                                      () => _checked[e.key] = !_checked[e.key],
                                    ),
                              ),
                            ),
                            const SizedBox(height: 35),

                            // ── Instructions ─────────────────────────────────
                            const Text(
                              'Instructions',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 25),
                            ...steps.asMap().entries.map(
                              (e) => InstructionItem(
                                number: e.key + 1,
                                text: e.value,
                              ),
                            ),

                            // ── YouTube link (if present) ───────────────────
                            if (meal.youtube != null &&
                                meal.youtube!.isNotEmpty) ...[
                              const SizedBox(height: 10),
                              GestureDetector(
                                // TODO: launch URL via url_launcher package
                                onTap: () {},
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.play_circle_fill_rounded,
                                      color: Colors.red,
                                      size: 28,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Watch on YouTube',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.red.shade700,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // ── Sticky "Add to Favourites" button ──────────────────────
                Positioned(
                  bottom: bottomPadding + 20,
                  left: 24,
                  right: 24,
                  child: BlocBuilder<FavoriteCubit, FavoriteState>(
                    builder: (context, favoriteState) {
                      bool isFavorited = false;

                      if (favoriteState is FavoriteSuccess) {
                        isFavorited = context.read<FavoriteCubit>().isFavorite(
                          meal.idMeal,
                        );
                      }

                      return SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isFavorited ? Colors.grey : _primaryColor,
                            foregroundColor: Colors.white,
                            elevation: 5,
                            shadowColor: _primaryColor.withValues(alpha: 0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          onPressed: () {
                            final favoriteModel = FavoriteModel(
                              id: meal.idMeal,
                              title: meal.strMeal,
                              image: meal.thumbnail,
                              isFavorite: true,
                            );
                            context.read<FavoriteCubit>().toggleFavorite(
                              favoriteModel,
                            );
                          },
                          icon: Icon(
                            isFavorited
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 22,
                          ),
                          label: Text(
                            isFavorited
                                ? 'Remove from Favorites'
                                : 'Add to Favorites',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
