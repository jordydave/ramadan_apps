part of 'surat_list_extender.dart';

class SuratListBloc extends GetxController with _Extender {
  final GetAllSurahUseCase getAllSurahUseCase = Get.find();

  @override
  void onInit() {
    super.onInit();
    fetchSurah();
  }

  Future<void> fetchSurah() async {
    userDataState.value = LoadingCase();
    final result = await getAllSurahUseCase();

    result.fold(
      (error) {
        userDataState.value = ErrorCase(error);
      },
      (data) {
        listSurah.assignAll(data);
        userDataState.value = LoadedCase(data);
      },
    );
  }
}
