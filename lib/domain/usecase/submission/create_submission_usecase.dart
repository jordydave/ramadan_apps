import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/data/dto/response/base_response/base_response.dart';

abstract class CreateSubmissionUsecase {
  Future<Either<BaseResponse, BaseResponse>> call({
    required String accessToken,
    required int reasonId,
    required List<String> submissionDates,
    required String keterangan,
    String? attachmentPath,
  });
}
