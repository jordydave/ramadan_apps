import 'dart:ui';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/text_styles.dart';
import 'package:ramadan_apps/ui_kit/widgets/shared_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SharedPasswordConfirmationBottomSheet extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const SharedPasswordConfirmationBottomSheet({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  static void show({
    required BuildContext context,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
        child: SafeArea(
          top: false,
          child: SharedPasswordConfirmationBottomSheet(
            onConfirm: onConfirm,
            onCancel: onCancel,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  'Simpan Password',
                  style: AppTextStyles.h3.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColor.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 1.6.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  'Cek dua kali apakah sudah sesuai dengan data yang ada',
                  style: AppTextStyles.body.copyWith(
                    color: AppColor.greyColor600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 4.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    SharedButton(
                      title: 'Ya, Simpan Sekarang',
                      onPressed: () {
                        Get.back();
                        onConfirm();
                      },
                      color: AppColor.secondaryColor,
                      borderColor: AppColor.secondaryColor,
                      textColor: Colors.white,
                      width: double.infinity,
                    ),
                    SizedBox(height: 1.6.h),
                    SharedButton(
                      title: 'Tidak, Lihat Sekali Lagi',
                      onPressed: () {
                        Get.back();
                        onCancel();
                      },
                      color: Colors.white,
                      borderColor: AppColor.secondaryColor,
                      textColor: AppColor.secondaryColor,
                      width: double.infinity,
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: -4.h,
            child: Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.secondaryColor.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 14),
                  ),
                ],
              ),
              child: Icon(Icons.lock, color: AppColor.whiteColor, size: 12.w),
            ),
          ),
        ],
      ),
    );
  }
}
