import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_finder/core/constant/color_manager.dart';

import 'core/routes/app_routes.dart';

class RecipeFinder extends StatelessWidget {
  const RecipeFinder({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: ColorManager.whiteColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recipe Finder',
        theme: ThemeData(
          scaffoldBackgroundColor: ColorManager.whiteColor,
          appBarTheme: AppBarTheme(
            backgroundColor: ColorManager.whiteColor,
            elevation: 0,
          ),
          textTheme: GoogleFonts.plusJakartaSansTextTheme(),
        ),
        initialRoute: Routes.authRoute,
        onGenerateRoute: AppRoutes().generateRoutes,
      ),
    );
  }
}
