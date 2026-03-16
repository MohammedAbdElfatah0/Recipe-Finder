import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/feature/category/data/repo/category_repo.dart';

import '../../../data/model/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepo) : super(CategoryInitial());

  final CategoryRepo categoryRepo;

  Future<void> getCategory() async {
    emit(CategoryLoading());

    final result = await categoryRepo.getCategory();
    result.fold(
      (l) => emit(CategoryFailure(l)),
      (r) => emit(CategorySuccess(r.categories)),
    );
  }
}
