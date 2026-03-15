import 'package:flutter/material.dart';
import 'package:recipe_finder/core/constant/color_manager.dart';

class Tag extends StatelessWidget {
  final String text;
  final Color color;
  final bool isGrey;

  const Tag({
    super.key,
    required this.text,
    required this.color,
    this.isGrey = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color:
            isGrey
                ? ColorManager.darkGreyColor.withValues(alpha: 0.3)
                : color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          color: color,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
