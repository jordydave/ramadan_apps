import 'package:flutter/material.dart';
import 'dart:math';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/text_styles.dart';

class AyahItem extends StatelessWidget {
  final int number;
  final String arabic;
  final String translation;

  const AyahItem({
    super.key,
    required this.number,
    required this.arabic,
    required this.translation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColor.greyColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              _buildOctagonNumber(number),
              const Spacer(),
              Row(
                children: [
                  Icon(Icons.share_outlined, color: AppColor.primaryColor),
                  const SizedBox(width: 16),
                  Icon(Icons.play_arrow_outlined, color: AppColor.primaryColor),
                  const SizedBox(width: 16),
                  Icon(Icons.bookmark_border, color: AppColor.primaryColor),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            arabic,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily:
                  'Amiri', // Assuming an Arabic font is available or default
              height: 2.0,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            translation,
            style: AppTextStyles.body.copyWith(
              color: AppColor.greyColor,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildOctagonNumber(int number) {
    return SizedBox(
      width: 36,
      height: 36,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: pi / 4,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Text(
            number.toString(),
            style: AppTextStyles.subtitle2.copyWith(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
