import 'package:flutter/material.dart';

import '../../../../core/constant/color_manager.dart';
import '../../../../core/constant/image_manager.dart';
import '../../../../core/constant/style_manager.dart';

class InfoProfile extends StatelessWidget {
  const InfoProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //in center
        //image
        Stack(
          alignment: AlignmentGeometry.center,
          children: [
            CircleAvatar(
              maxRadius: 80,
              backgroundImage: AssetImage(ImageManager.loginBackground),
            ),
            Padding(
              padding: EdgeInsetsGeometry.fromLTRB(
                160 / 2 + 25,
                160 / 2 + 25,
                0,
                0,
              ),
              child: GestureDetector(
                onTap: () {
                  //TODO upload image to change
                },
                child: Align(
                  alignment: AlignmentGeometry.center,
                  child: CircleAvatar(
                    backgroundColor: ColorManager.secondary,
                    child: Icon(Icons.edit, color: ColorManager.whiteColor),
                  ),
                ),
              ),
            ),
          ],
        ),
        //name text
        Text(
          'Mohammed Mohammed abd Elfatah',
          style: StyleManager.s24w700,
          // softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
        Text('Mohammed@gmail.com', style: StyleManager.s24w700),

        //email text
      ],
    );
  }
}
