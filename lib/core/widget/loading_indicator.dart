import 'package:flutter/material.dart';

import '../constant/color_manager.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ColorManager.primary,
        backgroundColor: ColorManager.whiteColor,
      ),
    );
  }
}
