part of 'surat_detail_extender.dart';

class SuratDetailBloc extends GetxController with _Extender {
  @override
  void onInit() {
    super.onInit();
    getSurahDetailUseCase = Get.find();
    final args = Get.arguments;
    if (args is int) {
      fetchSurahDetail(args);
    }
  }

  Future<void> fetchSurahDetail(int id) async {
    userDataState.value = LoadingCase();
    final result = await getSurahDetailUseCase(id);
    result.fold(
      (failure) {
        userDataState.value = ErrorCase(failure);
      },
      (data) {
        surahDetail.value = data;
        userDataState.value = LoadedCase(data);
      },
    );
  }

  Future<void> fetchTafsir(int id) async {
    // Only fetch if empty to avoid stale or redundant calls
    if (tafsirList.isNotEmpty) return;

    tafsirState.value = LoadingCase();
    final result = await getTafsirUseCase(id);

    result.fold(
      (failure) {
        tafsirState.value = ErrorCase(failure);
      },
      (data) {
        tafsirList.assignAll(data);
        tafsirState.value = LoadedCase(data);
      },
    );
  }
}
