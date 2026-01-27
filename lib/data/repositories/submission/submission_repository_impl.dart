import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/data/datasources/submission_datasource.dart';
import 'package:ramadan_apps/data/dto/response/base_response/base_response.dart';
import 'package:ramadan_apps/data/repositories/submission/submission_repository.dart';
import 'package:ramadan_apps/domain/entities/submission/reason.dart';
import 'package:ramadan_apps/domain/entities/submission/submission.dart';

class SubmissionRepositoryImpl implements SubmissionRepository {
  final SubmissionDatasource datasource;

  SubmissionRepositoryImpl({required this.datasource});

  @override
  Future<Either<BaseResponse, SubmissionList>> getSubmissions({
    required String accessToken,
    int page = 1,
    int limit = 10,
    int? bulan,
    int? tahun,
  }) async {
    try {
      final result = await datasource.getSubmissions(
        accessToken,
        page: page,
        limit: limit,
        bulan: bulan,
        tahun: tahun,
      );
      return result.fold((error) => Left(error), (response) {
        Map<String, dynamic> submissionData = {
          'data': response.data is List ? response.data : [],
          'meta': response.meta ?? {},
        };

        return Right(SubmissionList.fromJson(submissionData));
      });
    } catch (e) {
      return Left(
        BaseResponse(
          success: false,
          statusCode: 500,
          message: e.toString(),
          data: null,
        ),
      );
    }
  }

  @override
  Future<Either<BaseResponse, ReasonList>> getReasons({
    required String accessToken,
  }) async {
    try {
      final result = await datasource.getReasons(accessToken);
      return result.fold((error) => Left(error), (response) {
        Map<String, dynamic> reasonData = {
          'data': response.data is List ? response.data : [],
        };

        return Right(ReasonList.fromJson(reasonData));
      });
    } catch (e) {
      return Left(
        BaseResponse(
          success: false,
          statusCode: 500,
          message: e.toString(),
          data: null,
        ),
      );
    }
  }

  @override
  Future<Either<BaseResponse, BaseResponse>> createSubmission({
    required String accessToken,
    required int reasonId,
    required List<String> submissionDates,
    required String keterangan,
    String? attachmentPath,
  }) async {
    try {
      final result = await datasource.createSubmission(
        accessToken: accessToken,
        reasonId: reasonId,
        submissionDates: submissionDates,
        keterangan: keterangan,
        attachmentPath: attachmentPath,
      );
      return result;
    } catch (e) {
      return Left(
        BaseResponse(
          success: false,
          statusCode: 500,
          message: e.toString(),
          data: null,
        ),
      );
    }
  }

  @override
  Future<Either<BaseResponse, BaseResponse>> updateSubmission({
    required String accessToken,
    required int submissionId,
    int? reasonId,
    List<String>? submissionDates,
    String? keterangan,
    String? attachmentPath,
    bool deleteAttachment = false,
  }) async {
    try {
      final result = await datasource.updateSubmission(
        accessToken: accessToken,
        submissionId: submissionId,
        reasonId: reasonId,
        submissionDates: submissionDates,
        keterangan: keterangan,
        attachmentPath: attachmentPath,
        deleteAttachment: deleteAttachment,
      );
      return result;
    } catch (e) {
      return Left(
        BaseResponse(
          success: false,
          statusCode: 500,
          message: e.toString(),
          data: null,
        ),
      );
    }
  }
}
