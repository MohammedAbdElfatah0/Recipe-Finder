import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:recipe_finder/core/network/dio_service.dart';

import '../../../../core/network/end_point.dart';
import '../../../home/data/model/category_response.dart';
import '../model/meals_response.dart';
import '../model/meatls_details_response.dart';

class CategoryRepo {
  CategoryRepo(this._dioService);
  final DioService _dioService;

  Future<Either<String, CategoriesResponse>> getCategory() async {
    try {
      final res = await _dioService.getData(EndPoint.categories);
      return right(CategoriesResponse.fromJson(res.data));
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, MealsResponse>> getCategoryByFilter(
    String filter,
  ) async {
    try {
      final res = await _dioService.getData(
        '${EndPoint.filterCategory}$filter',
      );
      log('🔴🔴🔴res ::::${MealsResponse.fromJson(res.data).meals}');
      return right(MealsResponse.fromJson(res.data));
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, MealDetailsResponse>> getMealDetails(String id) async {
    try {
      final res = await _dioService.getData(
        '${EndPoint.detailsCategoryItem}$id',
      );
      return right(MealDetailsResponse.fromJson(res.data));
    } catch (e) {
      return left(e.toString());
    }
  }
}
