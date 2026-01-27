import 'package:ramadan_apps/ui_kit/widgets/animated.dart';
import 'package:ramadan_apps/ui_kit/widgets/blank_builder.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CommonShimmer extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final bool animated;
  const CommonShimmer({
    super.key,
    required this.child,
    required this.isLoading,
    this.animated = true,
  });

  @override
  Widget build(BuildContext context) {
    if (animated == true) {
      return AnimatedSwitcherBuilder(
        builder: () {
          if (isLoading) {
            return Shimmer.fromColors(
              period: const Duration(milliseconds: 3000),
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: IgnorePointer(ignoring: isLoading, child: child),
            );
          } else {
            return child;
          }
        },
      );
    } else {
      return BlankBuilder(() {
        if (isLoading) {
          return Shimmer.fromColors(
            period: const Duration(milliseconds: 1500),
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: IgnorePointer(ignoring: isLoading, child: child),
          );
        } else {
          return child;
        }
      });
    }
  }
}
