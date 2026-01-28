import 'package:flutter/material.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/text_styles.dart';

class CountdownTimer extends StatelessWidget {
  final Duration duration;

  const CountdownTimer({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTimeBlock(hours, 'HRS'),
        _buildSeparator(),
        _buildTimeBlock(minutes, 'MIN'),
        _buildSeparator(),
        _buildTimeBlock(seconds, 'SEC'),
      ],
    );
  }

  Widget _buildTimeBlock(String value, String label) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFF8F9FA),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            value,
            style: AppTextStyles.h4.copyWith(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            fontSize: 10,
            color: AppColor.greyColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildSeparator() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20), // Align with the numbers
        child: Text(
          ':',
          style: AppTextStyles.h4.copyWith(color: AppColor.greyColor),
        ),
      ),
    );
  }
}
