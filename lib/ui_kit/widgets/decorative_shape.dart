import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DecorativeShape extends StatelessWidget {
  const DecorativeShape({super.key, required this.color, required this.icon});

  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.w,
      height: 12.w,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color, width: 2),
      ),
      child: Icon(icon, color: color, size: 6.w),
    );
  }
}
