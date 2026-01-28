import 'package:get/get.dart';
import 'package:ramadan_apps/core/get_state/get_state.dart';
import 'package:ramadan_apps/core/get_state/get_state_builder.dart';
import 'package:ramadan_apps/presentation/surat/surat_detail/surat_detail_worker.dart';
import 'package:ramadan_apps/presentation/surat/surat_list/bloc/surat_list_extender.dart';
import 'package:ramadan_apps/presentation/surat/surat_list/components/surah_search_bar.dart';
import 'package:ramadan_apps/presentation/surat/surat_list/components/surah_filter_tabs.dart';
import 'package:ramadan_apps/presentation/surat/surat_list/components/surah_item.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_apps/core/case/case.dart';

part 'surat_list_page.dart';

mixin class _Worker {
  final bloc = Get.find<SuratListBloc>();

  List<Worker> get workers {
    return [];
  }
}
