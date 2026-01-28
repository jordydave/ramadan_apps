import 'package:get/get.dart';
import 'package:ramadan_apps/core/case/case.dart';
import 'package:ramadan_apps/domain/entities/surah.dart';
import 'package:ramadan_apps/domain/usecase/surah/get_all_surah_usecase.dart';

part 'surat_list_bloc.dart';

mixin class _Extender {
  final selectedFilter = 0.obs; // 0: Surah, 1: Juz, 2: Hizb
  final listSurah = <Surah>[].obs;
  final userDataState = Rx<Case>(InitialCase());
}
