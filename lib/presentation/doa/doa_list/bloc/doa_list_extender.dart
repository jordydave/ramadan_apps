import 'package:get/get.dart';
import 'package:ramadan_apps/core/case/case.dart';
import 'package:ramadan_apps/domain/entities/doa.dart';
import 'package:ramadan_apps/domain/usecase/get_doa_list_usecase.dart';

part 'doa_list_bloc.dart';

mixin class _Extender {
  final getDoaListUseCase = Get.find<GetDoaListUseCase>();
  final userDataState = Rx<Case<List<Doa>>>(InitialCase());
  final selectedCategory = RxInt(0);

  // Dummy Categories (Keeping these for now as API doesn't seem to provide category list endpoint, or maybe just filter by 'tag' or 'grup' from list)
  final categories = [
    'All',
    'Daily',
    'Morning & Evening',
    'Prayer',
    'Hajj & Umrah',
  ];
}
