import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/feature/category/data/repo/category_repo.dart';

import '../../../data/model/meals_model.dart';

part 'meals_state.dart';

class MealsCubit extends Cubit<MealsState> {
  MealsCubit(this._categoryRepo) : super(MealsInitial());

  final CategoryRepo _categoryRepo;
  void getMeals(String categoryName) async {
    emit(MealsLoading());
    final result = await _categoryRepo.getCategoryByFilter(categoryName);
    result.fold(
      (error) => emit(MealsError(message: error)),
      (meals) => emit(MealsSuccess(meals: meals.meals)),
    );
  }
}
