part of 'doa_list_extender.dart';

class DoaListBloc extends GetxController with _Extender {
  @override
  void onInit() {
    super.onInit();
    getDoaList();
  }

  Future<void> getDoaList() async {
    userDataState.value = LoadingCase();
    final result = await getDoaListUseCase();
    result.fold(
      (failure) => userDataState.value = ErrorCase(failure),
      (data) => userDataState.value = LoadedCase(data),
    );
  }

  void selectCategory(int index) {
    selectedCategory.value = index;
    // TODO: Implement filtering logic if needed
  }
}
