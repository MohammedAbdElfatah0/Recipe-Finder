import 'package:flutter/material.dart';
import 'package:recipe_finder/core/constant/color_manager.dart';

class IngredientItem extends StatelessWidget {
  final String text;
  final Color color;
  final bool isChecked;
  final VoidCallback onTap;

  const IngredientItem({
    super.key,
    required this.text,
    required this.color,
    required this.isChecked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color:
                    isChecked
                        ? color.withValues(alpha: 0.9)
                        : color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.check_rounded,
                size: 18,
                color: isChecked ? ColorManager.whiteColor : color,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 16,
                  color:
                      isChecked
                          ? ColorManager.greyColor.withAlpha(255 * 40 ~/ 100)
                          : ColorManager.greyColor.withValues(alpha: 1),
                  decoration:
                      isChecked
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                ),
                child: Text(text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
