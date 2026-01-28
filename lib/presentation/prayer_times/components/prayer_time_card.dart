import 'package:flutter/material.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/text_styles.dart';

class PrayerTimeCard extends StatelessWidget {
  final String name;
  final String time;
  final String status; // Completed, Upcoming, Next Prayer, None
  final String iconType; // sun, moon, sun_cloud

  const PrayerTimeCard({
    super.key,
    required this.name,
    required this.time,
    required this.status,
    required this.iconType,
  });

  @override
  Widget build(BuildContext context) {
    final bool isNextPrayer = status == 'Next Prayer';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: isNextPrayer ? Colors.white : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: isNextPrayer
            ? Border.all(color: AppColor.secondaryColor, width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildIcon(),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.h5.copyWith(
                    color: isNextPrayer
                        ? AppColor.secondaryColor
                        : AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (status != 'None' && status != 'Next Prayer')
                  Text(
                    status,
                    style: AppTextStyles.caption.copyWith(
                      color: AppColor.greyColor,
                    ),
                  ),
                if (status == 'Next Prayer')
                  Text(
                    'Next Prayer',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColor.secondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),
          Text(
            time,
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.bold,
              color: isNextPrayer ? AppColor.goldColor : AppColor.primaryColor,
            ),
          ),
          const SizedBox(width: 16),
          _buildNotificationIcon(),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    IconData iconData = Icons.wb_sunny_outlined;
    if (iconType == 'moon') iconData = Icons.nightlight_round;
    if (iconType == 'sun_cloud') iconData = Icons.wb_twilight;

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(iconData, color: AppColor.greyColor, size: 20),
    );
  }

  Widget _buildNotificationIcon() {
    // Logic for notification icon state could be added here
    if (status == 'Completed' || status == 'None') {
      return Icon(
        Icons.notifications_off_outlined,
        color: AppColor.greyColor.withValues(alpha: 0.5),
        size: 20,
      );
    }
    return Icon(
      Icons.notifications_active,
      color: AppColor.secondaryColor,
      size: 20,
    );
  }
}
