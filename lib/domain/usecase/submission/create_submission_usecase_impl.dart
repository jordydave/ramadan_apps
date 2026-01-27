import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/data/dto/response/base_response/base_response.dart';
import 'package:ramadan_apps/data/repositories/submission/submission_repository.dart';
import 'package:ramadan_apps/domain/usecase/submission/create_submission_usecase.dart';

class CreateSubmissionUsecaseImpl implements CreateSubmissionUsecase {
  final SubmissionRepository repository;

  CreateSubmissionUsecaseImpl({required this.repository});

  @override
  Future<Either<BaseResponse, BaseResponse>> call({
    required String accessToken,
    required int reasonId,
    required List<String> submissionDates,
    required String keterangan,
    String? attachmentPath,
  }) async {
    return await repository.createSubmission(
      accessToken: accessToken,
      reasonId: reasonId,
      submissionDates: submissionDates,
      keterangan: keterangan,
      attachmentPath: attachmentPath,
    );
  }
}
