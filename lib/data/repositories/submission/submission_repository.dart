import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/data/dto/response/base_response/base_response.dart';
import 'package:ramadan_apps/domain/entities/submission/reason.dart';
import 'package:ramadan_apps/domain/entities/submission/submission.dart';

abstract class SubmissionRepository {
  Future<Either<BaseResponse, SubmissionList>> getSubmissions({
    required String accessToken,
    int page = 1,
    int limit = 10,
    int? bulan,
    int? tahun,
  });

  Future<Either<BaseResponse, ReasonList>> getReasons({
    required String accessToken,
  });

  Future<Either<BaseResponse, BaseResponse>> createSubmission({
    required String accessToken,
    required int reasonId,
    required List<String> submissionDates,
    required String keterangan,
    String? attachmentPath,
  });

  Future<Either<BaseResponse, BaseResponse>> updateSubmission({
    required String accessToken,
    required int submissionId,
    int? reasonId,
    List<String>? submissionDates,
    String? keterangan,
    String? attachmentPath,
    bool deleteAttachment = false,
  });
}
