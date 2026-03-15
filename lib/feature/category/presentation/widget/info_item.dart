import 'package:flutter/material.dart';

import '../../../../core/constant/color_manager.dart';

class InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const InfoItem({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: ColorManager.greyColor.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: ColorManager.blackColor.withValues(alpha: 0.87),
            ),
          ),
        ],
      ),
    );
  }
}
