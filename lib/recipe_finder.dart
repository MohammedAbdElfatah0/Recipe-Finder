import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/routes/app_routes.dart';

class RecipeFinder extends StatelessWidget {
  const RecipeFinder({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Finder',
      theme: ThemeData(
        textTheme: GoogleFonts.plusJakartaSansTextTheme()
      ),
      initialRoute: Routes.authRoute,
      onGenerateRoute: AppRoutes().generateRoutes,
    );
  }
}
