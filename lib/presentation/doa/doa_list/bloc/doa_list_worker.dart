import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramadan_apps/presentation/doa/doa_list/bloc/doa_list_extender.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/text_styles.dart';
import 'package:ramadan_apps/core/get_state/get_state.dart';
import 'package:ramadan_apps/presentation/doa/doa_list/components/category_chip.dart';
import 'package:ramadan_apps/presentation/doa/doa_list/components/doa_card.dart';
import 'package:ramadan_apps/core/case/case.dart';
import 'package:ramadan_apps/domain/entities/doa.dart';
import 'package:ramadan_apps/presentation/doa/doa_detail/bloc/doa_detail_worker.dart';

part 'package:ramadan_apps/presentation/doa/doa_list/doa_list_page.dart';

mixin class _Worker {
  final bloc = Get.put(DoaListBloc());

  List<Worker> get workers {
    return [];
  }
}
