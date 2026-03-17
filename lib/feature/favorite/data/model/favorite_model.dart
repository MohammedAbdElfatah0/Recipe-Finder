import 'package:hive_flutter/hive_flutter.dart';
part 'favorite_model.g.dart';

@HiveType(typeId: 0)
class FavoriteModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String image;
  @HiveField(3)
  bool isFavorite;

  FavoriteModel({
    required this.id,
    required this.title,
    required this.image,
    required this.isFavorite,
  });
}
