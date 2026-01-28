import 'package:flutter/material.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          const Text(
            'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيم',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              // fontFamily: 'Amiri',
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 1,
            width: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  AppColor.primaryColor.withValues(alpha: 0.5),
                  Colors.white,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
