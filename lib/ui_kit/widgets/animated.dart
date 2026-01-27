import 'package:flutter/material.dart';
import 'package:ramadan_apps/ui_kit/widgets/animated_switcher_size.dart';
import 'package:ramadan_apps/ui_kit/widgets/blank_builder.dart';

class AnimatedSwitcherBuilder extends StatelessWidget {
  final Widget Function() builder;
  final Duration fadeDuration;
  final Duration sizeDuration;
  const AnimatedSwitcherBuilder({
    super.key,
    required this.builder,
    this.fadeDuration = const Duration(milliseconds: 200),
    this.sizeDuration = const Duration(milliseconds: 200),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcherSize(
      fadeDuration: (this).fadeDuration,
      sizeDuration: (this).sizeDuration,
      child: (this).builder(),
    );
  }
}

class AnimatedSwitcherWidget extends StatelessWidget {
  final Widget child;
  final Duration fadeDuration;
  final Duration sizeDuration;
  const AnimatedSwitcherWidget({
    super.key,
    required this.child,
    this.fadeDuration = const Duration(milliseconds: 200),
    this.sizeDuration = const Duration(milliseconds: 200),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcherSize(
      fadeDuration: (this).fadeDuration,
      sizeDuration: (this).sizeDuration,
      child: (this).child,
    );
  }
}

class AnimatedVisibility extends StatelessWidget {
  final Widget child;
  final bool show;
  final Duration fadeDuration;
  final Duration sizeDuration;
  const AnimatedVisibility({
    super.key,
    required this.child,
    this.show = true,
    this.fadeDuration = const Duration(milliseconds: 200),
    this.sizeDuration = const Duration(milliseconds: 200),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcherSize(
      fadeDuration: (this).fadeDuration,
      sizeDuration: (this).sizeDuration,
      fadeInCurve: Curves.bounceInOut,
      fadeOutCurve: Curves.bounceInOut,
      sizeCurve: Curves.bounceInOut,
      child: BlankBuilder(() {
        if (show == true) {
          return (this).child;
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}
