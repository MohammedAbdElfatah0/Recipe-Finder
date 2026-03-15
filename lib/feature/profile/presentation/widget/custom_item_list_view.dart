import 'package:flutter/material.dart';

import '../../../../core/constant/color_manager.dart';

class CustomItemListView extends StatelessWidget {
  const CustomItemListView({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: ColorManager.whiteColor.withValues(alpha: 0.9),
      child: ListTile(
        onTap: () {},
        title: Text(title),
        leading: CircleAvatar(
          backgroundColor: ColorManager.secondary.withValues(alpha: 0.3),
          child: Icon(icon, color: ColorManager.secondary, size: 26),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 21,
          color: ColorManager.darkGreyColor.withAlpha(255 * 50 ~/ 100),
        ),
      ),
    );
  }
}
