import 'package:ramadan_apps/core/extension/get_extension.dart';
import 'package:ramadan_apps/domain/usecase/surah/get_all_surah_usecase.dart';
import 'package:ramadan_apps/domain/usecase/surah/get_all_surah_usecase_impl.dart';
import 'package:ramadan_apps/domain/usecase/surah/get_surah_detail_usecase.dart';
import 'package:ramadan_apps/domain/usecase/surah/get_tafsir_usecase.dart';
import 'package:ramadan_apps/domain/usecase/get_doa_list_usecase.dart';
import 'package:ramadan_apps/domain/usecase/get_doa_detail_usecase.dart';
import 'package:ramadan_apps/domain/usecase/get_provinsi_list_usecase.dart';
import 'package:ramadan_apps/domain/usecase/get_kab_kota_list_usecase.dart';

import 'package:get/get.dart';

class DomainDependencies {
  DomainDependencies() {
    Get.lazy<GetAllSurahUseCase>(
      GetAllSurahUseCaseImpl(repository: Get.find()),
    );
    Get.lazy<GetSurahDetailUseCase>(
      GetSurahDetailUseCaseImpl(repository: Get.find()),
    );

    Get.lazy<GetTafsirUseCase>(GetTafsirUseCaseImpl(repository: Get.find()));

    Get.lazy<GetDoaListUseCase>(GetDoaListUseCase(repository: Get.find()));

    Get.lazy<GetDoaDetailUseCase>(GetDoaDetailUseCase(repository: Get.find()));

    Get.lazy<GetProvinsiListUseCase>(
      GetProvinsiListUseCase(repository: Get.find()),
    );
    Get.lazy<GetKabKotaListUseCase>(
      GetKabKotaListUseCase(repository: Get.find()),
    );
  }
}
