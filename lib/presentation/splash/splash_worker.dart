import 'package:ramadan_apps/core/get_state/get_state.dart';
import 'package:ramadan_apps/core/get_state/get_state_builder.dart';
// import 'package:ramadan_apps/gen/assets.gen.dart';
import 'package:ramadan_apps/presentation/splash/bloc/splash_extender.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
part 'splash_page.dart';

mixin class _Worker {
  final bloc = Get.find<SplashBloc>();

  List<Worker> get workers {
    return [];
  }
}
