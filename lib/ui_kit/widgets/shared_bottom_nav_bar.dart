import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/widgets/shared_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SharedBottomNavBar extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPressed;
  final Border? border;
  final Color? backgroundColor;
  final Color? buttonColor;
  final Color? buttonBorderColor;
  final Color? buttonTextColor;
  final bool enabled;

  const SharedBottomNavBar({
    super.key,
    required this.buttonTitle,
    required this.onPressed,
    this.border,
    this.backgroundColor,
    this.buttonColor,
    this.buttonBorderColor,
    this.buttonTextColor,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          border: Border(
            top: BorderSide(color: AppColor.blackColor.withValues(alpha: 0.2)),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: SharedButton(
          title: buttonTitle,
          onPressed: onPressed,
          color: buttonColor ?? AppColor.secondaryColor,
          borderColor: buttonBorderColor ?? AppColor.secondaryColor,
          textColor: buttonTextColor ?? Colors.white,
          width: double.infinity,
          enabled: enabled,
        ),
      ),
    );
  }
}
