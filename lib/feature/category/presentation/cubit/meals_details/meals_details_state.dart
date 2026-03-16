part of 'meals_details_cubit.dart';

sealed class MealsDetailsState {}

final class MealsDetailsInitial extends MealsDetailsState {}

final class MealsDetailsLoading extends MealsDetailsState {}

final class MealsDetailsSuccess extends MealsDetailsState {
  final List<MealDetailsModel> meals;
  MealsDetailsSuccess({required this.meals});
}

final class MealsDetailsError extends MealsDetailsState {
  final String message;
  MealsDetailsError({required this.message});
}