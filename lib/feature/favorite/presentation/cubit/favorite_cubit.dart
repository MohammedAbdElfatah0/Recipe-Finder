import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/model/favorite_model.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  Box<FavoriteModel> get _box => Hive.box<FavoriteModel>('favorites');

  void loadedFavorite() {
    try {
      final items = _box.values.toList();
      emit(FavoriteSuccess(favorites: items));
    } catch (e) {
      emit(FavoriteError(message: e.toString()));
    }
  }

  void toggleFavorite(FavoriteModel category) {
    try {
      if (_box.containsKey(category.id)) {
        _box.delete(category.id);
      } else {
        _box.put(category.id, category..isFavorite = true);
      }
      loadedFavorite(); // re-emit updated list
    } catch (e) {
      emit(FavoriteError(message: e.toString()));
    }
  }

  bool isFavorite(String id) => _box.containsKey(id);
}
