import 'package:flutter/material.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/text_styles.dart';
// import 'package:flutter_svg/flutter_svg.dart'; // Using Container for now as specific SVG implementation details aren't known, will use Border for shape

class SurahItem extends StatelessWidget {
  final int number;
  final String name;
  final String meaning;
  final int ayas;
  final String type;
  final String arabicName;

  const SurahItem({
    super.key,
    required this.number,
    required this.name,
    required this.meaning,
    required this.ayas,
    required this.type,
    required this.arabicName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        // Drop shadow might be subtle or removed for list items depending on exact match, but design shows separation.
        // Assuming white cards on off-white background based on previous designs, keeping simple white background for items.
        // Or if the background is white, these might be flat. The image shows cards.
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Number Badge (Octagon-ish shape manually drawn or stacked)
          SizedBox(
            width: 44,
            height: 44,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Simplified Octagon (Rotated Square) or Custom Image
                // Using a rotated box with border for "Star/Octagon" effect approximation
                Transform.rotate(
                  angle: 0.785, // 45 degrees
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.goldColor, width: 2.5),
                      borderRadius: BorderRadius.circular(
                        4,
                      ), // Slightly rounded corners
                    ),
                  ),
                ),
                Text(
                  number.toString(),
                  style: AppTextStyles.body.copyWith(
                    color: AppColor.goldColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    // Tag for Type (Meccan/Medinan)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: type == 'Meccan'
                            ? const Color(0xFFFFE0B2) // Light Orange
                            : const Color(0xFFC8E6C9), // Light Green
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        type,
                        style: AppTextStyles.caption.copyWith(
                          color: type == 'Meccan'
                              ? Colors.orange[800]
                              : Colors.green[800],
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        '$meaning • $ayas Ayahs',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColor.greyColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            arabicName,
            style: AppTextStyles.h2.copyWith(
              color: AppColor.secondaryColor,
              fontFamily: 'Amiri', // Assuming font
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
