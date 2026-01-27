import 'package:flutter/material.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SharedContainerLogo extends StatelessWidget {
  const SharedContainerLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.w,
      height: 24.w,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
    );
  }
}
