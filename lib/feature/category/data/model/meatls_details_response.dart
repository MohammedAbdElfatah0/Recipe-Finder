import 'meal_details_model.dart';

class MealDetailsResponse {
  final List<MealDetailsModel> meals;

  MealDetailsResponse({required this.meals});

  factory MealDetailsResponse.fromJson(Map<String, dynamic> json) {
    return MealDetailsResponse(
      meals: (json['meals'] as List)
          .map((e) => MealDetailsModel.fromJson(e))
          .toList(),
    );
  }
}