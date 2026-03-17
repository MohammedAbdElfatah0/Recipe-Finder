import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitial());
  final ProfileRepo _profileRepo;

  Future<void> getUserData() async {
    emit(ProfileLoading());
    final result = await _profileRepo.getDateUser();
    result.fold((l) => emit(ProfileError(l)), (r) => emit(ProfileSuccess(r)));
  }

  Future<void> logout() async {
    emit(ProfileLoading());
    final result = await _profileRepo.signOut();
    result.fold(
      (error) => emit(ProfileError(error)),
      (_) => emit(ProfileInitial()), // Successfully logged out
    );
  }
}
