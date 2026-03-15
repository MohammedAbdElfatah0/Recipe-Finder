import 'package:flutter/material.dart';
import 'package:recipe_finder/core/constant/string_manager.dart';
import 'package:recipe_finder/feature/profile/domain/info_model.dart';

List<InfoModel> account = [
  InfoModel(title: StringManager.profile.editProfile, icon: Icons.person),
  InfoModel(
    title: StringManager.profile.changePassword,
    icon: Icons.security_sharp,
  ),
  InfoModel(
    title: StringManager.profile.notificationSetting,
    icon: Icons.notifications_active_outlined,
  ),
];
List<InfoModel> prefernce = [
  InfoModel(
    title: StringManager.profile.darkMode,
    icon: Icons.dark_mode_outlined,
  ),
  InfoModel(
    title: StringManager.profile.languages,
    icon: Icons.language_outlined,
  ),
];
List<InfoModel> support = [
  InfoModel(title: StringManager.profile.helpCenter, icon: Icons.help_rounded),
  InfoModel(
    title: StringManager.profile.privacyPollicy,
    icon: Icons.privacy_tip_outlined,
  ),
  InfoModel(title: StringManager.profile.termsOfSerice, icon: Icons.book),
];
