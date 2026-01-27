import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SharedLoading extends StatelessWidget {
  const SharedLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: LoadingAnimationWidget.threeRotatingDots(
        color: AppColor.primaryColor,
        size: 30,
      ),
    );
  }
}
