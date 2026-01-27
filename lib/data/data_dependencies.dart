import 'package:ramadan_apps/core/extension/get_extension.dart';
import 'package:ramadan_apps/data/datasources/submission_datasource.dart';
import 'package:ramadan_apps/data/repositories/submission/submission_repository.dart';
import 'package:ramadan_apps/data/repositories/submission/submission_repository_impl.dart';
import 'package:get/get.dart';

class DataDependencies {
  DataDependencies() {
    Get.lazy(SubmissionDatasource(httpUtil: Get.find()));

    Get.lazy<SubmissionRepository>(
      SubmissionRepositoryImpl(datasource: Get.find()),
    );
  }
}
