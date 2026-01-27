import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:ramadan_apps/core/extension/string_extension.dart';
import 'package:ramadan_apps/data/dto/response/base_response/base_response.dart';
import 'package:ramadan_apps/data/dto/response/submission/reason_response.dart';
import 'package:ramadan_apps/data/dto/response/submission/submission_response.dart';
import 'package:ramadan_apps/network/http_logger/http_inspector.dart';
import 'package:ramadan_apps/network/http_logger/http_interceptor.dart';
import 'package:ramadan_apps/network/http_util/http_adapter.dart';
import 'package:ramadan_apps/network/http_util/http_util.dart';
import 'package:get/get.dart';

class SubmissionDatasource {
  final HttpUtil httpUtil;
  final dio.Dio _dio = dio.Dio()
    ..httpClientAdapter = HTTPAdapter(preserveHeaderCase: true);

  SubmissionDatasource({required this.httpUtil}) {
    _dio.options.connectTimeout = const Duration(milliseconds: 30000);
    _dio.options.receiveTimeout = const Duration(milliseconds: 30000);
    if (Get.isRegistered<HttpInspector>()) {
      final httpInspector = Get.find<HttpInspector>();
      _dio.interceptors.add(httpInspector.interceptor);
    }
    _dio.interceptors.add(HttpInterceptor());
  }

  Future<Either<BaseResponse, SubmissionResponse>> getSubmissions(
    String accessToken, {
    int page = 1,
    int limit = 10,
    int? bulan,
    int? tahun,
  }) async {
    try {
      final queryParameters = <String, dynamic>{'page': page, 'limit': limit};

      if (bulan != null) {
        queryParameters['bulan'] = bulan;
      }
      if (tahun != null) {
        queryParameters['tahun'] = tahun;
      }

      final response = await _dio.get(
        'mobile/submission'.api,
        options: dio.Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
            'accept': 'application/json',
          },
        ),
        queryParameters: queryParameters,
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! <= 299) {
        final jsonData = response.data as Map<String, dynamic>;
        return Right(SubmissionResponse.fromJson(jsonData));
      } else {
        final jsonData = response.data as Map<String, dynamic>? ?? {};
        return Left(
          BaseResponse(
            success: false,
            statusCode: response.statusCode ?? 400,
            message: jsonData['message'] ?? response.statusMessage,
            data: jsonData['data'],
          ),
        );
      }
    } on dio.DioException catch (e) {
      return Left(
        BaseResponse(
          success: false,
          statusCode: e.response?.statusCode ?? 400,
          message: e.response?.data?['message'] ?? e.message,
          data: e.response?.data,
        ),
      );
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

  Future<Either<BaseResponse, ReasonResponse>> getReasons(
    String accessToken,
  ) async {
    try {
      final response = await _dio.get(
        'mobile/submission/reasons/list'.api,
        options: dio.Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
            'accept': 'application/json',
          },
        ),
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! <= 299) {
        final jsonData = response.data as Map<String, dynamic>;
        return Right(ReasonResponse.fromJson(jsonData));
      } else {
        final jsonData = response.data as Map<String, dynamic>? ?? {};
        return Left(
          BaseResponse(
            success: false,
            statusCode: response.statusCode ?? 400,
            message: jsonData['message'] ?? response.statusMessage,
            data: jsonData['data'],
          ),
        );
      }
    } on dio.DioException catch (e) {
      return Left(
        BaseResponse(
          success: false,
          statusCode: e.response?.statusCode ?? 400,
          message: e.response?.data?['message'] ?? e.message,
          data: e.response?.data,
        ),
      );
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

  Future<Either<BaseResponse, BaseResponse>> createSubmission({
    required String accessToken,
    required int reasonId,
    required List<String> submissionDates,
    required String keterangan,
    String? attachmentPath,
  }) async {
    try {
      final Map<String, dynamic> formDataMap = {
        'reasonId': reasonId.toString(),
        'submissionDates': jsonEncode(submissionDates),
        'keterangan': keterangan,
      };

      if (attachmentPath != null) {
        formDataMap['attachment'] = await dio.MultipartFile.fromFile(
          attachmentPath,
          filename: attachmentPath.split('/').last,
        );
      }

      final formData = dio.FormData.fromMap(formDataMap);

      final response = await _dio.post(
        'mobile/submission'.api,
        data: formData,
        options: dio.Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'accept': 'application/json',
          },
        ),
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! <= 299) {
        final jsonData = response.data as Map<String, dynamic>;
        return Right(BaseResponse.fromJson(jsonData));
      } else {
        final jsonData = response.data as Map<String, dynamic>? ?? {};
        return Left(
          BaseResponse(
            success: false,
            statusCode: response.statusCode ?? 400,
            message: jsonData['message'] ?? response.statusMessage,
            data: jsonData['data'],
          ),
        );
      }
    } on dio.DioException catch (e) {
      return Left(
        BaseResponse(
          success: false,
          statusCode: e.response?.statusCode ?? 400,
          message: e.response?.data?['message'] ?? e.message,
          data: e.response?.data,
        ),
      );
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
      final Map<String, dynamic> formDataMap = {};

      if (reasonId != null) {
        formDataMap['reasonId'] = reasonId.toString();
      }

      if (submissionDates != null) {
        formDataMap['submissionDates'] = jsonEncode(submissionDates);
      }

      if (keterangan != null) {
        formDataMap['keterangan'] = keterangan;
      }

      if (deleteAttachment) {
        formDataMap['deleteAttachment'] = 'true';
      }

      if (attachmentPath != null) {
        formDataMap['attachment'] = await dio.MultipartFile.fromFile(
          attachmentPath,
          filename: attachmentPath.split('/').last,
        );
      }

      final formData = dio.FormData.fromMap(formDataMap);

      final response = await _dio.patch(
        'mobile/submission/$submissionId'.api,
        data: formData,
        options: dio.Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'accept': 'application/json',
          },
        ),
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! <= 299) {
        final jsonData = response.data as Map<String, dynamic>;
        return Right(BaseResponse.fromJson(jsonData));
      } else {
        final jsonData = response.data as Map<String, dynamic>? ?? {};
        return Left(
          BaseResponse(
            success: false,
            statusCode: response.statusCode ?? 400,
            message: jsonData['message'] ?? response.statusMessage,
            data: jsonData['data'],
          ),
        );
      }
    } on dio.DioException catch (e) {
      return Left(
        BaseResponse(
          success: false,
          statusCode: e.response?.statusCode ?? 400,
          message: e.response?.data?['message'] ?? e.message,
          data: e.response?.data,
        ),
      );
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
