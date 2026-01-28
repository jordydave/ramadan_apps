import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramadan_apps/core/get_state/get_state.dart';
import 'package:ramadan_apps/presentation/surat/surat_detail/bloc/surat_detail_extender.dart';

import 'package:ramadan_apps/core/case/case.dart';
import 'package:ramadan_apps/core/get_state/get_state_builder.dart';
import 'package:ramadan_apps/presentation/surat/surat_detail/components/audio_player_bar.dart';
import 'package:ramadan_apps/presentation/surat/surat_detail/components/ayah_item.dart';
import 'package:ramadan_apps/presentation/surat/surat_detail/components/detail_header.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/text_styles.dart';

part 'surat_detail_page.dart';

mixin class _Worker {
  final bloc = Get.find<SuratDetailBloc>();

  List<Worker> get workers {
    return [];
  }
}
