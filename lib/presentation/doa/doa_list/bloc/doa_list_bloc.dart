part of 'doa_list_extender.dart';

class DoaListBloc extends GetxController with _Extender {
  @override
  void onInit() {
    super.onInit();
    // Simulate loading
    userDataState.value = LoadedCase(doaList);
  }

  void selectCategory(int index) {
    selectedCategory.value = index;
  }
}
