import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

extension GetExtension on GetInterface {
  void lazy<T>(T object) {
    (this).lazyPut<T>(() => object, fenix: true);
  }

  void closeLoading() {
    while (((this).isDialogOpen ?? false)) {
      (this).back();
    }
  }

  void showLoading() {
    (this).dialog(
      Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: AppColor.greyColor.withValues(alpha: 0.2),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
          child: Center(
            child: LoadingAnimationWidget.threeRotatingDots(
              color: AppColor.primaryColor,
              size: 50,
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
