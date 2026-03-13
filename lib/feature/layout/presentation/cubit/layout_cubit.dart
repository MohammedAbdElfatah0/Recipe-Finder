import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../favorite/presentation/view/favortire_screen.dart';
import '../../../home/presentation/view/home_screen.dart';
import '../../../profile/presentation/view/profile_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(InitLayoutState());

  int currentIndex = 0;
  List<Widget> screen = const [
    HomeScreen(),
    FavortireScreen(),
    ProfileScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeLayoutState());
  }
}
