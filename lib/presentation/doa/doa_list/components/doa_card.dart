import 'package:flutter/material.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/text_styles.dart';

class DoaCard extends StatelessWidget {
  final String title;
  final String arabic;
  final String translation;

  const DoaCard({
    super.key,
    required this.title,
    required this.arabic,
    required this.translation,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              offset: const Offset(0, 4),
              blurRadius: 16,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.wb_twilight, // Placeholder icon
                    color: Color(0XFF282A3D),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.h5.copyWith(
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                Icon(
                  Icons.bookmark, // Using filled bookmark to match image style
                  color: AppColor.goldColor.withValues(
                    alpha: 0.6,
                  ), // Muted gold
                  size: 24,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                arabic,
                textAlign: TextAlign.right,
                style: AppTextStyles.h4.copyWith(
                  fontFamily:
                      'Amiri', // Assuming generic Arabic font or similar
                  height: 1.8,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              translation,
              style: AppTextStyles.body.copyWith(
                color: AppColor.greyColor600,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward_ios,
                color: AppColor.greyColor,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
