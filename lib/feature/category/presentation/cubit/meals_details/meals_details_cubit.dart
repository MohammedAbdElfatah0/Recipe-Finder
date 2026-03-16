import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/feature/category/data/model/meal_details_model.dart';
import 'package:recipe_finder/feature/category/data/repo/category_repo.dart';

part 'meals_details_state.dart';

class MealsDetailsCubit extends Cubit<MealsDetailsState> {
  MealsDetailsCubit(this._categoryRepo) : super(MealsDetailsInitial());

  final CategoryRepo _categoryRepo;
  void getMeals(String categoryName) async {
    emit(MealsDetailsLoading());
    final result = await _categoryRepo.getMealDetails(categoryName);
    result.fold(
      (error) => emit(MealsDetailsError(message: error)),
      (meals) => emit(MealsDetailsSuccess(meals: meals.meals)),
    );
  }
}
