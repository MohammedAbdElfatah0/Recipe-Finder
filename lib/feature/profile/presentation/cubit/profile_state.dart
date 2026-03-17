part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final DocumentSnapshot<Map<String, dynamic>> userData;
  ProfileSuccess(this.userData);
}

final class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}
