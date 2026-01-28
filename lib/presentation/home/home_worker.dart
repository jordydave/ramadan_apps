import 'package:ramadan_apps/core/get_state/get_state.dart';
import 'package:ramadan_apps/core/get_state/get_state_builder.dart';
import 'package:ramadan_apps/presentation/doa/doa_list/bloc/doa_list_worker.dart';
import 'package:ramadan_apps/presentation/home/bloc/home_extender.dart';
import 'package:ramadan_apps/presentation/surat/surat_list/surat_list_worker.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_apps/ui_kit/text_styles.dart';

part 'home_page.dart';
part 'components/home_header.dart';
part 'components/last_read_card.dart';
part 'components/quick_action_buttons.dart';
part 'components/verse_of_the_day.dart';
part 'components/popular_reciters.dart';

mixin class _Worker {
  final bloc = Get.find<HomeBloc>();

  List<Worker> get workers {
    return [];
  }
}
