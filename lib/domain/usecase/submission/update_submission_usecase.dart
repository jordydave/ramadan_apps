import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/data/dto/response/base_response/base_response.dart';

abstract class UpdateSubmissionUsecase {
  Future<Either<BaseResponse, BaseResponse>> call({
    required String accessToken,
    required int submissionId,
    int? reasonId,
    List<String>? submissionDates,
    String? keterangan,
    String? attachmentPath,
    bool deleteAttachment = false,
  });
}
