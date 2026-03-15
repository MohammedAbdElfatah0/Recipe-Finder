import 'package:flutter/material.dart';
import 'package:recipe_finder/core/constant/color_manager.dart';

class InstructionItem extends StatelessWidget {
  final int number;
  final String text;

  const InstructionItem({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
              color: ColorManager.blueDarkColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '$number',
              style: const TextStyle(
                color: ColorManager.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: ColorManager.greyColor.withValues(alpha: 1),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
