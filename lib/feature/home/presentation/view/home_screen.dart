import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/core/constant/color_manager.dart';
import 'package:recipe_finder/core/constant/string_manager.dart';
import 'package:recipe_finder/core/constant/style_manager.dart';

import '../../../../core/network/dio_service.dart';
import '../../../category/data/repo/category_repo.dart';
import '../cubit/category/category_cubit.dart';
import '../widget/gied_category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => CategoryCubit(CategoryRepo(DioService()))..getCategory(),
      child: Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
          leadingWidth: 0,
          title: Text(StringManager.appName, style: StyleManager.s20w700),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: ColorManager.primary),
            ),
          ],
        ),
        //*category section
        //*details category section
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            switch (state) {
              case CategorySuccess():
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StringManager.category,
                            style: StyleManager.s18w700,
                          ),
                          Text(
                            StringManager.seeAll,
                            style: StyleManager.s12w600.copyWith(
                              color: ColorManager.primary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Expanded(
                        child: GridView.builder(
                          itemCount: state.categories.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 0.85,
                              ),
                          itemBuilder: (context, index) {
                            return GiedCategory(
                              category: state.categories[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              case CategoryLoading():
                return Center(child: CircularProgressIndicator());
              case CategoryFailure():
                return Text('Something went wrong, please try again');
              default:
                return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
