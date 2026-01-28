import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramadan_apps/core/case/case.dart';
import 'package:ramadan_apps/core/get_state/get_state.dart';
import 'package:ramadan_apps/domain/entities/doa.dart';
import 'package:ramadan_apps/presentation/doa/doa_detail/bloc/doa_detail_extender.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/text_styles.dart';

part 'package:ramadan_apps/presentation/doa/doa_detail/doa_detail_page.dart';

mixin class _Worker {
  final bloc = Get.put(DoaDetailBloc());

  List<Worker> get workers {
    return [];
  }
}
