import 'package:flutter/material.dart';

class BlankBuilder extends StatelessWidget {
  final Widget Function() builder;
  const BlankBuilder(this.builder, {super.key});

  @override
  Widget build(BuildContext context) {
    return builder();
  }
}
