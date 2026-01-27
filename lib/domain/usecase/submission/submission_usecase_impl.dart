import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/data/dto/response/base_response/base_response.dart';
import 'package:ramadan_apps/data/repositories/submission/submission_repository.dart';
import 'package:ramadan_apps/domain/entities/submission/submission.dart';
import 'package:ramadan_apps/domain/usecase/submission/submission_usecase.dart';

class SubmissionUsecaseImpl implements SubmissionUsecase {
  final SubmissionRepository repository;

  SubmissionUsecaseImpl({required this.repository});

  @override
  Future<Either<BaseResponse, SubmissionList>> call({
    required String accessToken,
    int page = 1,
    int limit = 10,
    int? bulan,
    int? tahun,
  }) async {
    return await repository.getSubmissions(
      accessToken: accessToken,
      page: page,
      limit: limit,
      bulan: bulan,
      tahun: tahun,
    );
  }
}
