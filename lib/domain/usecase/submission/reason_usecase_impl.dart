import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/data/dto/response/base_response/base_response.dart';
import 'package:ramadan_apps/data/repositories/submission/submission_repository.dart';
import 'package:ramadan_apps/domain/entities/submission/reason.dart';
import 'package:ramadan_apps/domain/usecase/submission/reason_usecase.dart';

class ReasonUsecaseImpl implements ReasonUsecase {
  final SubmissionRepository repository;

  ReasonUsecaseImpl({required this.repository});

  @override
  Future<Either<BaseResponse, ReasonList>> call({
    required String accessToken,
  }) async {
    return await repository.getReasons(accessToken: accessToken);
  }
}
