import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/data/dto/response/base_response/base_response.dart';
import 'package:ramadan_apps/domain/entities/submission/submission.dart';

abstract class SubmissionUsecase {
  Future<Either<BaseResponse, SubmissionList>> call({
    required String accessToken,
    int page = 1,
    int limit = 10,
    int? bulan,
    int? tahun,
  });
}
