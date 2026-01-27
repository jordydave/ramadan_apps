import 'dart:ui';

import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SharedConfirmationDialog extends StatelessWidget {
  final String? title;
  final String error;
  final String? yesButton;
  final String? noButton;
  const SharedConfirmationDialog({
    super.key,
    this.title,
    required this.error,
    this.yesButton,
    this.noButton,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
      child: AlertDialog(
        actionsPadding: EdgeInsets.only(right: 10.sp, bottom: 10.sp),
        title: Text(
          title ?? "Sorry..",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        content: Text(
          error.isEmpty ? "Ooops, terjadi masalah" : error,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: Text(
              noButton ?? "OK",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColor,
              ),
            ),
          ),
          SizedBox(width: 1.w),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: Text(
              yesButton ?? "OK",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
