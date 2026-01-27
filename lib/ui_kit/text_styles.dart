import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static double fontSizeMultiplier = 1.0;

  static TextStyle get h1 => GoogleFonts.poppins(
    fontSize: (24 * fontSizeMultiplier).sp,
    fontWeight: FontWeight.w700,
    color: AppColor.textPrimary,
  );

  static TextStyle get h2 => GoogleFonts.poppins(
    fontSize: (22 * fontSizeMultiplier).sp,
    fontWeight: FontWeight.w700,
    color: AppColor.textPrimary,
  );

  static TextStyle get h3 => GoogleFonts.poppins(
    fontSize: (20 * fontSizeMultiplier).sp,
    fontWeight: FontWeight.w600,
    color: AppColor.textPrimary,
  );

  static TextStyle get h4 => GoogleFonts.poppins(
    fontSize: (18 * fontSizeMultiplier).sp,
    fontWeight: FontWeight.w600,
    color: AppColor.textPrimary,
  );

  static TextStyle get h5 => GoogleFonts.poppins(
    fontSize: (16 * fontSizeMultiplier).sp,
    fontWeight: FontWeight.w600,
    color: AppColor.textPrimary,
  );

  static TextStyle get h6 => GoogleFonts.poppins(
    fontSize: (14 * fontSizeMultiplier).sp,
    fontWeight: FontWeight.w600,
    color: AppColor.textPrimary,
  );

  static TextStyle get subtitle1 => GoogleFonts.poppins(
    fontSize: (15 * fontSizeMultiplier).sp,
    fontWeight: FontWeight.w500,
    color: AppColor.greyColor,
  );

  static TextStyle get subtitle2 => GoogleFonts.poppins(
    fontSize: (14 * fontSizeMultiplier).sp,
    fontWeight: FontWeight.w500,
    color: AppColor.greyColor,
  );

  static TextStyle get bodyLarge => GoogleFonts.poppins(
    fontSize: (15 * fontSizeMultiplier).sp,
    fontWeight: FontWeight.w500,
    color: AppColor.textPrimary,
  );

  static TextStyle get body => GoogleFonts.poppins(
    fontSize: (14 * fontSizeMultiplier).sp,
    fontWeight: FontWeight.w400,
    color: AppColor.textPrimary,
  );

  static TextStyle get bodySmall => GoogleFonts.poppins(
    fontSize: (12 * fontSizeMultiplier).sp,
    fontWeight: FontWeight.w400,
    color: AppColor.textPrimary,
  );

  static TextStyle get caption => GoogleFonts.poppins(
    fontSize: (11 * fontSizeMultiplier).sp,
    fontWeight: FontWeight.w400,
    color: AppColor.greyColor,
  );

  static TextStyle get overline => GoogleFonts.poppins(
    fontSize: (10 * fontSizeMultiplier).sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.0,
    color: AppColor.greyColor,
  );

  static TextStyle get button => GoogleFonts.poppins(
    fontSize: (15 * fontSizeMultiplier).sp,
    fontWeight: FontWeight.w600,
    color: AppColor.whiteColor,
  );

  static TextStyle get link => GoogleFonts.poppins(
    fontSize: (14 * fontSizeMultiplier).sp,
    fontWeight: FontWeight.w600,
    color: AppColor.primaryColor,
    decoration: TextDecoration.underline,
  );

  static TextStyle get input => GoogleFonts.poppins(
    fontSize: (15.5 * fontSizeMultiplier).sp,
    fontWeight: FontWeight.w500,
    color: AppColor.textPrimary,
  );

  static TextStyle get inputHint => GoogleFonts.poppins(
    fontSize: (15.5 * fontSizeMultiplier).sp,
    fontWeight: FontWeight.w500,
    color: AppColor.greyColor,
  );

  static TextStyle get labelSmall => GoogleFonts.poppins(
    fontSize: (12 * fontSizeMultiplier).sp,
    fontWeight: FontWeight.w500,
    color: AppColor.greyColor,
  );

  static TextStyle get error => GoogleFonts.poppins(
    fontSize: (12 * fontSizeMultiplier).sp,
    fontWeight: FontWeight.w500,
    color: AppColor.errorColor,
  );

  static TextStyle custom({
    double sizeSp = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) {
    return GoogleFonts.poppins(
      fontSize: (sizeSp * fontSizeMultiplier).sp,
      fontWeight: fontWeight,
      color: color ?? AppColor.textPrimary,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
      fontStyle: fontStyle,
    );
  }
}
