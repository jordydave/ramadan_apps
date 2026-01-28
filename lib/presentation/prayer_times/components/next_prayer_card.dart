import 'package:flutter/material.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/text_styles.dart';
import 'package:ramadan_apps/presentation/prayer_times/components/countdown_timer.dart';

class NextPrayerCard extends StatelessWidget {
  final String nextPrayerName;
  final Duration countdownDuration;
  final String nextPrayerTime;

  const NextPrayerCard({
    super.key,
    required this.nextPrayerName,
    required this.countdownDuration,
    required this.nextPrayerTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'NEXT PRAYER',
            style: AppTextStyles.caption.copyWith(
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            nextPrayerName,
            style: AppTextStyles.h2.copyWith(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          CountdownTimer(duration: countdownDuration),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF9E6), // Light yellow/gold bg
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              nextPrayerTime,
              style: AppTextStyles.body.copyWith(
                color: AppColor.goldColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
