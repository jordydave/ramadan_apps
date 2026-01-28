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
}
