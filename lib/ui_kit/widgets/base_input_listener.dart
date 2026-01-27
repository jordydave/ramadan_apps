import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/widgets/animated.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BaseInputListener extends StatefulWidget {
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
  final Function(bool)? onFocusChange;
  final Color? color;

  const BaseInputListener({
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
    this.onFocusChange,
    this.color,
  });

  @override
  State<BaseInputListener> createState() => _BaseInputListenerState();
}

class _BaseInputListenerState extends State<BaseInputListener> {
  final error = Rxn<String>();
  void _listen() {
    if (widget.validator != null) {
      if (widget.controller.text.isNotEmpty) {
        error.value = widget.validator?.call(widget.controller.text);
      }
    }
  }

  @override
  void initState() {
    widget.controller.addListener(_listen);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_listen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: ((this).widget.validator != null)
          ? (v) => (this).widget.validator?.call(widget.controller.text)
          : null,
      builder: (_) {
        return Obx(() {
          final data = error.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: widget.onTap != null ? () => widget.onTap?.call() : null,
                child: IntrinsicHeight(
                  child: Container(
                    height: 29.5.sp,
                    decoration: BoxDecoration(
                      color: widget.fillColor ?? Colors.transparent,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: (data != null || widget.errorText != null)
                            ? Colors.red
                            : widget.color ?? AppColor.primaryColor,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (widget.leadingLabel != null) ...[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child:
                                (this).widget.leadingLabel ?? const SizedBox(),
                          ),
                        ],
                        Expanded(
                          child: Focus(
                            onFocusChange: (value) {
                              if (widget.validator != null) {
                                if (value == false) {
                                  error.value = widget.validator?.call(
                                    widget.controller.text,
                                  );
                                }
                              }
                              if (widget.onFocusChange != null) {
                                widget.onFocusChange?.call(value);
                              }
                            },
                            child: TextFormField(
                              onTap: widget.onTap != null
                                  ? () => widget.onTap?.call()
                                  : null,
                              readOnly: widget.readonly,
                              inputFormatters: (this).widget.inputFormatters,
                              controller: (this).widget.controller,
                              keyboardType: (this).widget.inputType,
                              obscureText: (this).widget.obscure,
                              enabled: (this).widget.enable,
                              onChanged: (this).widget.onTextChanged,
                              style: GoogleFonts.poppins(
                                fontSize: 15.5.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: (this).widget.contentPadding,
                                errorStyle: const TextStyle(height: 0.01),
                                floatingLabelBehavior:
                                    (this).widget.floatingLabelBehavior,
                                hintText: (this).widget.hint ?? 'Please Input',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: (this).widget.suffixIcon,
                                hintStyle:
                                    widget.hintStyle ??
                                    GoogleFonts.poppins(
                                      fontSize: 15.5.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.greyColor.withValues(
                                        alpha: 0.5,
                                      ),
                                    ),
                              ),
                            ),
                          ),
                        ),
                        if (widget.trailingWidget != null) ...[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child:
                                (this).widget.trailingWidget ??
                                const SizedBox(),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
              AnimatedVisibility(
                show: (data != null) || widget.errorText != null,
                child: Column(
                  children: [
                    SizedBox(height: 0.5.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Text(
                        widget.errorText != null
                            ? (widget.errorText ?? '')
                            : (data ?? ''),
                        textAlign: TextAlign.start,
                        style:
                            widget.errorStyle ??
                            GoogleFonts.poppins(
                              fontSize: 12.sp,
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
        });
      },
    );
  }
}
