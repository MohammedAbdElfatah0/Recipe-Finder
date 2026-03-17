import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_finder/firebase_options.dart';
import 'package:recipe_finder/feature/favorite/data/model/favorite_model.dart';

import 'recipe_finder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Register the adapter and open the box
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(FavoriteModelAdapter());
  }
  await Hive.openBox<FavoriteModel>('favorites');

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const RecipeFinder());
}
