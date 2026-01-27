import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/data/dto/response/base_response/base_response.dart';

abstract class HttpUtil {
  Future<Either<BaseResponse, dynamic>> get({
    required String uri,
    Map<String, String>? header,
    Map<String, dynamic>? parameter,
  });

  Future<Either<BaseResponse, dynamic>> post({
    required String uri,
    Map<String, String>? header,
    Map<String, dynamic>? parameter,
    Map<String, dynamic>? body,
    bool multipart = false,
  });

  Future<Either<BaseResponse, dynamic>> put({
    required String uri,
    Map<String, String>? header,
    Map<String, dynamic>? parameter,
    Map<String, dynamic>? body,
  });

  Future<Either<BaseResponse, dynamic>> delete({
    required String uri,
    Map<String, String>? header,
    Map<String, dynamic>? parameter,
    Map<String, dynamic>? body,
    bool multipart = false,
  });
}
