import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/widgets/animated.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BaseInput extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final FloatingLabelBehavior floatingLabelBehavior;
  final EdgeInsetsGeometry contentPadding;
  final String? Function(String?)? validator;
  final Function(String)? onTextChanged;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextStyle? errorStyle;
  final bool obscure;
  final bool enable;
  final bool readonly;
  final Color? fillColor;
  final String? hint;
  final double? height;
  final Widget? suffixIcon;
  final Widget? leadingLabel;
  final Widget? trailingWidget;
  final TextStyle? hintStyle;
  final VoidCallback? onTap;
  final String? errorText;

  const BaseInput({
    super.key,
    this.contentPadding = const EdgeInsets.fromLTRB(12, 6, 12, 6),
    this.inputType = TextInputType.text,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    required this.controller,
    this.obscure = false,
    this.enable = true,
    this.readonly = false,
    this.onTap,
    this.validator,
    this.onTextChanged,
    this.suffixIcon,
    this.fillColor,
    this.errorStyle,
    this.height,
    this.hint,
    this.leadingLabel,
    this.trailingWidget,
    this.hintStyle,
    this.inputFormatters,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: ((this).validator != null)
          ? (v) => (this).validator?.call(controller.text)
          : null,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onTap != null ? () => onTap?.call() : null,
              child: IntrinsicHeight(
                child: Container(
                  height: 29.5.sp,
                  decoration: BoxDecoration(
                    color: fillColor ?? Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: (state.hasError || errorText != null)
                          ? AppColor.errorColor
                          : AppColor.greyColor,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (leadingLabel != null) ...[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: (this).leadingLabel ?? const SizedBox(),
                        ),
                      ],
                      Expanded(
                        child: TextFormField(
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          onTap: onTap != null ? () => onTap?.call() : null,
                          readOnly: readonly,
                          inputFormatters: (this).inputFormatters,
                          controller: (this).controller,
                          keyboardType: (this).inputType,
                          obscureText: (this).obscure,
                          enabled: (this).enable,
                          onChanged: (this).onTextChanged,
                          style: GoogleFonts.poppins(
                            fontSize: 15.5.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.color,
                          ),
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: (this).contentPadding,
                            errorStyle: const TextStyle(height: 0.01),
                            floatingLabelBehavior: (this).floatingLabelBehavior,
                            hintText: (this).hint ?? 'Please Input',
                            border: InputBorder.none,
                            suffixIcon: (this).suffixIcon,
                            hintStyle:
                                hintStyle ??
                                GoogleFonts.poppins(
                                  fontSize: 15.5.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.blackColor,
                                ),
                          ),
                        ),
                      ),
                      if (trailingWidget != null) ...[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: (this).trailingWidget ?? const SizedBox(),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            AnimatedVisibility(
              show:
                  (state.hasError && state.errorText != '') ||
                  errorText != null,
              child: Column(
                children: [
                  SizedBox(height: 0.5.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Text(
                      errorText != null
                          ? (errorText ?? '')
                          : (state.errorText ?? ''),
                      textAlign: TextAlign.start,
                      style:
                          errorStyle ??
                          GoogleFonts.poppins(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
