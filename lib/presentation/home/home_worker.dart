import 'package:ramadan_apps/core/get_state/get_state.dart';
import 'package:ramadan_apps/core/get_state/get_state_builder.dart';
import 'package:ramadan_apps/presentation/home/bloc/home_extender.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/text_styles.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

part 'home_page.dart';

mixin class _Worker {
  final bloc = Get.find<HomeBloc>();

  List<Worker> get workers {
    return [];
  }
}
