import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ramadan_apps/data/dto/response/base_response/base_response.dart';
import 'package:ramadan_apps/network/http_logger/http_inspector.dart';
import 'package:ramadan_apps/network/http_logger/http_interceptor.dart';
import 'package:ramadan_apps/network/http_util/http_adapter.dart';
import 'package:ramadan_apps/network/http_util/http_util.dart';

part 'http_util_extender.dart';

class HttpUtilImpl extends HttpUtil with _Extender {
  HttpUtilImpl({required HttpInspector httpInspector}) {
    _dio.options.connectTimeout = const Duration(milliseconds: 30000);
    _dio.options.receiveTimeout = const Duration(milliseconds: 30000);
    _dio.interceptors.add(httpInspector.interceptor);
    _dio.interceptors.add(HttpInterceptor());
  }

  @override
  Future<Either<BaseResponse, dynamic>> post({
    required String uri,
    Map<String, String>? header,
    Map<String, dynamic>? parameter,
    Map<String, dynamic>? body,
    bool multipart = false,
  }) async {
    _dio.options.headers = _setHeader(header);
    try {
      final response = await _dio.post(
        uri,
        data: multipart ? FormData.fromMap(body ?? {}) : body,
        queryParameters: parameter,
      );
      return (this)._dioResponse(response);
    } on DioException catch (e) {
      return Left((this)._dioCatch(e));
    } catch (e) {
      return Left(
        BaseResponse(
          success: false,
          statusCode: 500,
          message: 'Internal Server Error',
          data: null,
        ),
      );
    }
  }

  @override
  Future<Either<BaseResponse, dynamic>> get({
    required String uri,
    Map<String, String>? header,
    Map<String, dynamic>? parameter,
  }) async {
    _dio.options.headers = _setHeader(header);
    try {
      final response = await _dio.get(uri, queryParameters: parameter);
      return (this)._dioResponse(response);
    } on DioException catch (e) {
      return Left((this)._dioCatch(e));
    } catch (e) {
      return Left(
        BaseResponse(
          success: false,
          statusCode: 500,
          message: 'Internal Server Error',
          data: null,
        ),
      );
    }
  }

  @override
  Future<Either<BaseResponse, dynamic>> delete({
    required String uri,
    Map<String, String>? header,
    Map<String, dynamic>? parameter,
    Map<String, dynamic>? body,
    bool multipart = false,
  }) async {
    _dio.options.headers = _setHeader(header);
    try {
      final response = await _dio.delete(
        uri,
        data: multipart ? FormData.fromMap(body ?? {}) : body,
        queryParameters: parameter,
      );
      return (this)._dioResponse(response);
    } on DioException catch (e) {
      return Left((this)._dioCatch(e));
    } catch (e) {
      return Left(
        BaseResponse(
          success: false,
          statusCode: 500,
          message: 'Internal Server Error',
          data: null,
        ),
      );
    }
  }

  @override
  Future<Either<BaseResponse, dynamic>> put({
    required String uri,
    Map<String, String>? header,
    Map<String, dynamic>? parameter,
    Map<String, dynamic>? body,
  }) async {
    _dio.options.headers = _setHeader(header);
    try {
      final response = await _dio.put(
        uri,
        data: body,
        queryParameters: parameter,
      );
      return (this)._dioResponse(response);
    } on DioException catch (e) {
      return Left((this)._dioCatch(e));
    } catch (e) {
      return Left(
        BaseResponse(
          success: false,
          statusCode: 500,
          message: 'Internal Server Error',
          data: null,
        ),
      );
    }
  }
}
