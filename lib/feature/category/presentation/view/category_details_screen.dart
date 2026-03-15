import 'package:flutter/material.dart';
import 'package:recipe_finder/core/constant/image_manager.dart';

import '../widget/info_item.dart';
import '../widget/ingredient_item.dart';
import '../widget/instruction_item.dart';
import '../widget/tag.dart';

class CategoryDetailsScreen extends StatefulWidget {
  const CategoryDetailsScreen({super.key});

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  static const _primaryColor = Color(0xFFFF6B4A);

  // Stateful ingredient check list
  final List<bool> _checked = List.filled(5, false);

  static const _ingredients = [
    '200g Linguine or Spaghetti',
    '2 cups Fresh Basil leaves',
    '2 cloves Garlic, minced',
    '1/2 tsp Red pepper flakes',
    '50g Pine nuts or Walnuts',
  ];

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // ─── SliverAppBar with curved image bottom ───────────────────
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
                      backgroundColor: Colors.white.withValues(alpha: 0.9),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                actions: [
                  // TODO add cubit for saving in DB
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16, top: 8),
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withValues(alpha: 0.9),
                        child: const Icon(
                          Icons.favorite_border,
                          color: _primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Food image
                      Image.asset(
                        ImageManager.loginBackground,
                        fit: BoxFit.cover,
                      ),
                      // ── Curved white overlay at the bottom of the image ──
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

              // ─── Scrollable content ──────────────────────────────────────
              SliverToBoxAdapter(
                child: Padding(
                  // bottom padding = button height (55) + spacing (20) + safe area
                  padding: EdgeInsets.fromLTRB(
                    24,
                    10, // reduced because curve already gives visual gap
                    24,
                    75 + 20 + bottomPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tags
                      Row(
                        children: [
                          Tag(text: 'ITALIAN', color: _primaryColor),
                          const SizedBox(width: 12),
                          Tag(
                            text: 'DINNER',
                            color: Colors.grey.shade600,
                            isGrey: true,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Title
                      const Text(
                        'Spicy Basil Pesto Pasta',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 25),

                      // Info row
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InfoItem(
                            icon: Icons.access_time_filled_rounded,
                            text: '25 mins',
                            color: _primaryColor,
                          ),
                          InfoItem(
                            icon: Icons.bar_chart_rounded,
                            text: 'Medium',
                            color: _primaryColor,
                          ),
                          InfoItem(
                            icon: Icons.local_fire_department_rounded,
                            text: '450 kcal',
                            color: _primaryColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 35),

                      // Ingredients
                      const Text(
                        'Ingredients',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ..._ingredients.asMap().entries.map(
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

                      // Instructions
                      const Text(
                        'Instructions',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 25),
                      const InstructionItem(
                        number: 1,
                        text:
                            'Bring a large pot of salted water to a boil. Cook the pasta according to package instructions until al dente. Reserve 1/2 cup of pasta water.',
                      ),
                      const InstructionItem(
                        number: 2,
                        text:
                            'While the pasta cooks, combine basil, garlic, nuts, and red pepper flakes in a food processor. Pulse until finely chopped.',
                      ),
                      const InstructionItem(
                        number: 3,
                        text:
                            'Slowly drizzle in olive oil while blending until smooth. Season with salt and pepper to taste.',
                      ),
                      const InstructionItem(
                        number: 4,
                        text:
                            'Toss the cooked pasta with the pesto sauce, adding reserved water as needed to reach desired consistency. Serve with grated parmesan.',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ─── Sticky bottom button (safe-area aware) ──────────────────────
          Positioned(
            bottom: bottomPadding + 20,
            left: 24,
            right: 24,
            child: SizedBox(
              height: 55,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primaryColor,
                  foregroundColor: Colors.white,
                  elevation: 5,
                  shadowColor: _primaryColor.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.favorite_border, size: 22),
                label: const Text(
                  'Add to Favorites',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
