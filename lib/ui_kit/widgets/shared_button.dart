import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SharedButton extends StatelessWidget {
  final BorderRadiusGeometry borderRadius;
  final String title;
  final VoidCallback onPressed;
  final double? height;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final double? width;
  final bool enabled;
  final double elevation;
  final double fontSize;
  final Color color;
  final Color? disabledColor;
  final Color borderColor;
  final Color textColor;
  final Widget? icon;
  final Color? iconColor;
  final double? iconSize;
  final bool iconAtEnd;
  final double? spacing;

  const SharedButton({
    super.key,
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
    required this.title,
    required this.onPressed,
    required this.color,
    required this.borderColor,
    required this.textColor,
    this.disabledColor,
    this.width,
    this.enabled = true,
    this.paddingVertical,
    this.paddingHorizontal,
    this.elevation = 0,
    this.fontSize = 16,
    this.height,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.iconAtEnd = false,
    this.spacing,
  });

  factory SharedButton.primary({
    required String title,
    required VoidCallback onPressed,
    double fontSize = 16,
    double? paddingVertical,
    double? paddingHorizontal,
    double? height,
    double? width,
    bool enabled = true,
    Color? color,
    Color? textColor,
    Color? disabledColor,
  }) {
    return SharedButton(
      title: title,
      onPressed: onPressed,
      color: color ?? AppColor.primaryColor,
      borderColor: color ?? AppColor.primaryColor,
      textColor: textColor ?? Colors.white,
      paddingHorizontal: paddingHorizontal,
      paddingVertical: paddingVertical,
      fontSize: fontSize,
      height: height,
      width: width,
      enabled: enabled,
      elevation: 8,
      disabledColor: disabledColor,
    );
  }

  factory SharedButton.secondary({
    required String title,
    required VoidCallback onPressed,
    double? paddingVertical,
    double? paddingHorizontal,
    double? height,
    double? width,
  }) {
    return SharedButton(
      title: title,
      onPressed: onPressed,
      color: Colors.white,
      borderColor: AppColor.primaryColor,
      textColor: AppColor.primaryColor,
      paddingHorizontal: paddingHorizontal,
      paddingVertical: paddingVertical,
      height: height,
      width: width,
      elevation: 8,
    );
  }

  factory SharedButton.text({
    required String title,
    required VoidCallback onPressed,
    double fontSize = 16,
    double? paddingVertical,
    double? paddingHorizontal,
    double? height,
    double? width,
  }) {
    return SharedButton(
      title: title,
      onPressed: onPressed,
      color: Colors.transparent,
      borderColor: Colors.transparent,
      textColor: AppColor.primaryColor,
      paddingHorizontal: paddingHorizontal,
      paddingVertical: paddingVertical,
      fontSize: fontSize,
      height: height,
      width: width,
    );
  }

  factory SharedButton.icon({
    required String title,
    required VoidCallback onPressed,
    required Widget icon,
    double fontSize = 16,
    double? paddingVertical,
    double? paddingHorizontal,
    double? height,
    double? width,
    bool enabled = true,
    double elevation = 8,
    BorderRadiusGeometry borderRadius = const BorderRadius.all(
      Radius.circular(30),
    ),
    Color? color,
    Color? borderColor,
    Color? textColor,
    Color? iconColor,
    double? iconSize,
    bool iconAtEnd = false,
    double spacing = 8,
  }) {
    final resolvedTextColor = textColor ?? AppColor.primaryColor;
    return SharedButton(
      title: title,
      onPressed: onPressed,
      color: color ?? Colors.white,
      borderColor: borderColor ?? AppColor.primaryColor,
      textColor: resolvedTextColor,
      paddingHorizontal: paddingHorizontal,
      paddingVertical: paddingVertical,
      fontSize: fontSize,
      height: height,
      width: width,
      enabled: enabled,
      elevation: elevation,
      borderRadius: borderRadius,
      icon: icon,
      iconColor: iconColor ?? resolvedTextColor,
      iconSize: iconSize,
      iconAtEnd: iconAtEnd,
      spacing: spacing,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 5.8.h,
      width: width,
      child: MaterialButton(
        onPressed: enabled ? onPressed : null,
        disabledColor: disabledColor ?? AppColor.greyColor,
        minWidth: 0,
        elevation: (this).elevation,
        color: color,
        highlightElevation: 0,
        focusElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: enabled
              ? BorderSide(color: borderColor, width: 1.0)
              : BorderSide(color: AppColor.greyColor, width: 1.0),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal != null ? paddingHorizontal! : 2.w,
          vertical: paddingVertical != null ? paddingVertical! : 1.h,
        ),
        child: icon == null
            ? Text(
                title,
                style: enabled
                    ? GoogleFonts.poppins(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      )
                    : GoogleFonts.poppins(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: iconAtEnd
                    ? [
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w600,
                            color: textColor,
                          ),
                        ),
                        SizedBox(width: spacing ?? 8),
                        icon!,
                      ]
                    : [
                        icon!,
                        SizedBox(width: spacing ?? 8),
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w600,
                            color: textColor,
                          ),
                        ),
                      ],
              ),
      ),
    );
  }
}
