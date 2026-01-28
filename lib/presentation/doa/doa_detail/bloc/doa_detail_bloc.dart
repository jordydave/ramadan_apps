part of 'doa_detail_extender.dart';

class DoaDetailBloc extends GetxController with _Extender {
  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is int) {
      getDoaDetail(args);
    } else if (args is Doa) {
      // If we pass the full object, use it directly
      doaDetailState.value = LoadedCase(args);
    }
  }

  Future<void> getDoaDetail(int id) async {
    doaDetailState.value = LoadingCase();
    final result = await getDoaDetailUseCase(id);
    result.fold(
      (failure) => doaDetailState.value = ErrorCase(failure),
      (data) => doaDetailState.value = LoadedCase(data),
    );
  }
}
