import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/feature/profile/presentation/cubit/profile_cubit.dart';

import '../../../auth/data/service/firestore_service.dart';
import '../../data/repo/profile_repo.dart';
import 'profile_screen_content.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProfileCubit(ProfileRepo(FirestoreService()))..getUserData(),
      child: const ProfileScreenContent(),
    );
  }
}
