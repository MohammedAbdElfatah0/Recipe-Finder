part of 'favorite_cubit.dart';

sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {
  final List<FavoriteModel> favorites;
  FavoriteSuccess({required this.favorites});
}

final class FavoriteError extends FavoriteState {
  final String message;
  FavoriteError({required this.message});
}
