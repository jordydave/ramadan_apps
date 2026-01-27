import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/data/dto/response/base_response/base_response.dart';
import 'package:ramadan_apps/data/repositories/submission/submission_repository.dart';
import 'package:ramadan_apps/domain/usecase/submission/update_submission_usecase.dart';

class UpdateSubmissionUsecaseImpl implements UpdateSubmissionUsecase {
  final SubmissionRepository repository;

  UpdateSubmissionUsecaseImpl({required this.repository});

  @override
  Future<Either<BaseResponse, BaseResponse>> call({
    required String accessToken,
    required int submissionId,
    int? reasonId,
    List<String>? submissionDates,
    String? keterangan,
    String? attachmentPath,
    bool deleteAttachment = false,
  }) async {
    return await repository.updateSubmission(
      accessToken: accessToken,
      submissionId: submissionId,
      reasonId: reasonId,
      submissionDates: submissionDates,
      keterangan: keterangan,
      attachmentPath: attachmentPath,
      deleteAttachment: deleteAttachment,
    );
  }
}
