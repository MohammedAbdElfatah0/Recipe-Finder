class MealDetailsModel {
  final String idMeal;
  final String strMeal;
  final String? category;
  final String? area;
  final String instructions;
  final String thumbnail;
  final String? youtube;

  final List<String> ingredients;
  final List<String> measures;

  MealDetailsModel({
    required this.idMeal,
    required this.strMeal,
    this.category,
    this.area,
    required this.instructions,
    required this.thumbnail,
    this.youtube,
    required this.ingredients,
    required this.measures,
  });

  factory MealDetailsModel.fromJson(Map<String, dynamic> json) {

    List<String> ingredients = [];
    List<String> measures = [];

    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];

      if (ingredient != null && ingredient.toString().trim().isNotEmpty) {
        ingredients.add(ingredient);
        measures.add(measure ?? '');
      }
    }

    return MealDetailsModel(
      idMeal: json['idMeal'] ?? '',
      strMeal: json['strMeal'] ?? '',
      category: json['strCategory'],
      area: json['strArea'],
      instructions: json['strInstructions'] ?? '',
      thumbnail: json['strMealThumb'] ?? '',
      youtube: json['strYoutube'],
      ingredients: ingredients,
      measures: measures,
    );
  }
}