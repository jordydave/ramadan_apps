import 'package:flutter/material.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/text_styles.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.goldColor : AppColor.primaryColorDark,
          borderRadius: BorderRadius.circular(24),
          border: isSelected ? null : Border.all(color: Colors.white12),
        ),
        child: Text(
          label,
          style: AppTextStyles.body.copyWith(
            color: Colors.white,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
