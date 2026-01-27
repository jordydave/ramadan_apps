import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/widgets/decorative_shape.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DecorativeElements extends StatelessWidget {
  const DecorativeElements({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DecorativeShape(color: AppColor.secondaryColor, icon: Icons.star),
            SizedBox(width: 3.w),
            DecorativeShape(color: AppColor.purpleColor, icon: Icons.favorite),
            SizedBox(width: 3.w),
            DecorativeShape(
              color: AppColor.primaryColor,
              icon: Icons.auto_awesome,
            ),
          ],
        ),
      ],
    );
  }
}
