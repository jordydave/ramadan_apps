import 'package:ramadan_apps/core/extension/get_extension.dart';
import 'package:ramadan_apps/data/datasources/submission_datasource.dart';
import 'package:ramadan_apps/data/datasources/surah_local_data_source.dart';
import 'package:ramadan_apps/data/datasources/surah_remote_data_source.dart';
import 'package:ramadan_apps/data/repositories/submission/submission_repository.dart';
import 'package:ramadan_apps/data/repositories/submission/submission_repository_impl.dart';
import 'package:ramadan_apps/data/repositories/surah_repository_impl.dart';

import 'package:ramadan_apps/domain/repositories/surah_repository.dart';
import 'package:ramadan_apps/data/datasources/doa_remote_data_source.dart';
import 'package:ramadan_apps/domain/repositories/doa_repository.dart';
import 'package:ramadan_apps/data/repositories/doa_repository_impl.dart';
import 'package:get/get.dart';

class DataDependencies {
  DataDependencies() {
    Get.lazy(SubmissionDatasource(httpUtil: Get.find()));

    Get.lazy<SubmissionRepository>(
      SubmissionRepositoryImpl(datasource: Get.find()),
    );

    Get.lazy<SurahRemoteDataSource>(
      SurahRemoteDataSource(httpUtil: Get.find()),
    );

    Get.lazy<SurahLocalDataSource>(SurahLocalDataSource());

    Get.lazy<SurahRepository>(
      SurahRepositoryImpl(
        remoteDataSource: Get.find(),
        localDataSource: Get.find(),
      ),
    );

    Get.lazy<DoaRemoteDataSource>(DoaRemoteDataSource(httpUtil: Get.find()));

    Get.lazy<DoaRepository>(DoaRepositoryImpl(dataSource: Get.find()));
  }
}
