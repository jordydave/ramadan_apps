import 'package:get/get.dart';
import 'package:ramadan_apps/core/case/case.dart';
import 'package:ramadan_apps/domain/entities/surah_detail.dart';
import 'package:ramadan_apps/domain/usecase/surah/get_surah_detail_usecase.dart';

part 'surat_detail_bloc.dart';

mixin class _Extender {
  final userDataState = Rx<Case>(InitialCase());
  final surahDetail = Rx<SurahDetail?>(null);

  late final GetSurahDetailUseCase getSurahDetailUseCase;
}
