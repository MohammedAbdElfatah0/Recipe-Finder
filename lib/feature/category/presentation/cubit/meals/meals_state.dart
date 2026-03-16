part of 'meals_cubit.dart';

sealed class MealsState {}

final class MealsInitial extends MealsState {}

final class MealsLoading extends MealsState {}

final class MealsSuccess extends MealsState {
  final List<MealModel> meals;
  MealsSuccess({required this.meals});
}

final class MealsError extends MealsState {
  final String message;
  MealsError({required this.message});
}