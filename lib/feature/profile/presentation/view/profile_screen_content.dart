import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/core/constant/color_manager.dart';
import 'package:recipe_finder/core/constant/image_manager.dart';
import 'package:recipe_finder/core/routes/app_routes.dart';
import 'package:recipe_finder/core/widgets/animated_logout_button.dart';
import 'package:recipe_finder/feature/profile/presentation/cubit/profile_cubit.dart';

import '../../../../core/constant/string_manager.dart';
import '../../../../core/constant/style_manager.dart';
import '../../domain/domain_list_profile.dart';
import '../widget/custom_item_list_view.dart';
import '../widget/info_profile.dart';

class ProfileScreenContent extends StatelessWidget {
  const ProfileScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileInitial) {
          // Successfully logged out, navigate to login screen
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(Routes.loginRoute, (route) => false);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: ListView(
              children: [
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is ProfileError) {
                      return Center(
                        child: Text(
                          'Error: ${state.message}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }

                    if (state is ProfileSuccess) {
                      final userData = state.userData.data();
                      return InfoProfile(
                        image:
                            userData?['image'] ?? ImageManager.loginBackground,
                        name: userData?['fullName'] ?? 'User',
                        email: userData?['email'] ?? 'No email',
                      );
                    }

                    // Initial state
                    return const InfoProfile(
                      image: '',
                      name: 'Loading...',
                      email: '',
                    );
                  },
                ),

                SizedBox(height: 12),
                Text(
                  StringManager.profile.account,
                  style: StyleManager.s18w700,
                ),

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
                Text(
                  StringManager.profile.support,
                  style: StyleManager.s18w700,
                ),

                ...support.map(
                  (item) =>
                      CustomItemListView(title: item.title, icon: item.icon),
                ),
                SizedBox(height: 12),
                AnimatedLogoutButton(
                  onPressed: () {
                    context.read<ProfileCubit>().logout();
                  },
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: ColorManager.secondary,
                      foregroundColor: Colors.red,
                      alignment: Alignment.center,
                    ),
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
                    onPressed: null, // Disabled since parent handles the press
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
