import '../model/meals_model.dart';

class MealsResponse {
  final List<MealModel> meals;

  MealsResponse({required this.meals});

  factory MealsResponse.fromJson(Map<String, dynamic> json) {
    return MealsResponse(
      meals: (json['meals'] as List).map((e) => MealModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'meals': meals.map((e) => e.toJson()).toList()};
  }
}
