import 'category_model.dart';

class CategoriesResponse {
  final List<CategoryModel> categories;

  CategoriesResponse({required this.categories});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
      categories:
          (json['categories'] as List)
              .map((e) => CategoryModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'categories': categories.map((e) => e.toJson()).toList()};
  }
}
