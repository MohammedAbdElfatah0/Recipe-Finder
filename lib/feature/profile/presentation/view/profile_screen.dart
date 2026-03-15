import 'package:flutter/material.dart';
import 'package:recipe_finder/core/constant/color_manager.dart';

import '../../../../core/constant/string_manager.dart';
import '../../../../core/constant/style_manager.dart';
import '../../domain/domain_list_profile.dart';
import '../widget/custom_item_list_view.dart';
import '../widget/info_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: ListView(
            children: [
              InfoProfile(),

              SizedBox(height: 12),
              Text(StringManager.profile.account, style: StyleManager.s18w700),

              ...account.map(
                (item) =>
                    CustomItemListView(title: item.title, icon: item.icon),
              ),
              SizedBox(height: 12),
              Text(
                StringManager.profile.prefernce,
                style: StyleManager.s18w700,
              ),

              ...prefernce.map(
                (item) =>
                    CustomItemListView(title: item.title, icon: item.icon),
              ),

              SizedBox(height: 12),
              Text(StringManager.profile.support, style: StyleManager.s18w700),

              ...support.map(
                (item) =>
                    CustomItemListView(title: item.title, icon: item.icon),
              ),
              SizedBox(height: 12),
              TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: ColorManager.secondary,
                  foregroundColor: Colors.red,
                  alignment: Alignment.center,
                ),
                onPressed: () {
                  //TODO logout
                },
                icon: const Icon(
                  Icons.logout,
                  color: ColorManager.whiteColor,
                  size: 26,
                ),
                label: Text(
                  StringManager.auth.logout,
                  style: StyleManager.s20w700.copyWith(
                    color: ColorManager.whiteColor,
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
