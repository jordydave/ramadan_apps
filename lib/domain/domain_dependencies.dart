import 'package:ramadan_apps/core/extension/get_extension.dart';
import 'package:ramadan_apps/domain/usecase/submission/create_submission_usecase.dart';
import 'package:ramadan_apps/domain/usecase/submission/create_submission_usecase_impl.dart';
import 'package:ramadan_apps/domain/usecase/submission/reason_usecase.dart';
import 'package:ramadan_apps/domain/usecase/submission/reason_usecase_impl.dart';
import 'package:ramadan_apps/domain/usecase/submission/submission_usecase.dart';
import 'package:ramadan_apps/domain/usecase/submission/submission_usecase_impl.dart';
import 'package:ramadan_apps/domain/usecase/submission/update_submission_usecase.dart';
import 'package:ramadan_apps/domain/usecase/submission/update_submission_usecase_impl.dart';
import 'package:ramadan_apps/domain/usecase/surah/get_all_surah_usecase.dart';
import 'package:ramadan_apps/domain/usecase/surah/get_all_surah_usecase_impl.dart';
import 'package:ramadan_apps/domain/usecase/surah/get_surah_detail_usecase.dart';
import 'package:ramadan_apps/domain/usecase/surah/get_tafsir_usecase.dart';

import 'package:get/get.dart';

class DomainDependencies {
  DomainDependencies() {
    Get.lazy<SubmissionUsecase>(SubmissionUsecaseImpl(repository: Get.find()));
    Get.lazy<ReasonUsecase>(ReasonUsecaseImpl(repository: Get.find()));
    Get.lazy<CreateSubmissionUsecase>(
      CreateSubmissionUsecaseImpl(repository: Get.find()),
    );
    Get.lazy<UpdateSubmissionUsecase>(
      UpdateSubmissionUsecaseImpl(repository: Get.find()),
    );
    Get.lazy<GetAllSurahUseCase>(
      GetAllSurahUseCaseImpl(repository: Get.find()),
    );
    Get.lazy<GetSurahDetailUseCase>(
      GetSurahDetailUseCaseImpl(repository: Get.find()),
    );

    Get.lazy<GetTafsirUseCase>(GetTafsirUseCaseImpl(repository: Get.find()));
  }
}
