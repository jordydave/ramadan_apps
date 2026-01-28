import 'package:get/get.dart';
import 'package:ramadan_apps/core/case/case.dart';
import 'package:ramadan_apps/domain/entities/doa.dart';
import 'package:ramadan_apps/domain/usecase/get_doa_detail_usecase.dart';

part 'doa_detail_bloc.dart';

mixin class _Extender {
  final getDoaDetailUseCase = Get.find<GetDoaDetailUseCase>();
  final doaDetailState = Rx<Case<Doa>>(InitialCase());
}
