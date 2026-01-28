import 'package:ramadan_apps/core/extension/get_extension.dart';
import 'package:ramadan_apps/data/datasources/surah_local_data_source.dart';
import 'package:ramadan_apps/data/datasources/surah_remote_data_source.dart';
import 'package:ramadan_apps/data/repositories/surah_repository_impl.dart';

import 'package:ramadan_apps/data/datasources/prayer_time_remote_data_source.dart';
import 'package:ramadan_apps/domain/repositories/prayer_time_repository.dart';
import 'package:ramadan_apps/data/repositories/prayer_time_repository_impl.dart';
import 'package:ramadan_apps/domain/repositories/surah_repository.dart';
import 'package:ramadan_apps/data/datasources/doa_remote_data_source.dart';
import 'package:ramadan_apps/domain/repositories/doa_repository.dart';
import 'package:ramadan_apps/data/repositories/doa_repository_impl.dart';
import 'package:get/get.dart';

class DataDependencies {
  DataDependencies() {
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

    Get.lazy<PrayerTimeRemoteDataSource>(
      PrayerTimeRemoteDataSourceImpl(httpUtil: Get.find()),
    );

    Get.lazy<PrayerTimeRepository>(
      PrayerTimeRepositoryImpl(remoteDataSource: Get.find()),
    );
  }
}
