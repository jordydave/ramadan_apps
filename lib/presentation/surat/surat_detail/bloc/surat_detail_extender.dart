import 'package:get/get.dart';
import 'package:ramadan_apps/core/case/case.dart';
import 'package:ramadan_apps/domain/entities/surah_detail.dart';
import 'package:ramadan_apps/domain/entities/tafsir.dart';
import 'package:ramadan_apps/domain/usecase/surah/get_surah_detail_usecase.dart';
import 'package:ramadan_apps/domain/usecase/surah/get_tafsir_usecase.dart';

part 'surat_detail_bloc.dart';

mixin class _Extender {
  final userDataState = Rx<Case>(InitialCase());
  final surahDetail = Rx<SurahDetail?>(null);
  final tafsirState = Rx<Case>(InitialCase());
  final tafsirList = RxList<Tafsir>([]);

  late final GetSurahDetailUseCase getSurahDetailUseCase;
  late final GetTafsirUseCase getTafsirUseCase = Get.find();
}
