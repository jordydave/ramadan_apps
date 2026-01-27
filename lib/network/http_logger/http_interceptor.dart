import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ramadan_apps/core/util/util.dart';
import 'package:ramadan_apps/network/http_logger/http_logger.dart';

class HttpInterceptor extends Interceptor {
  String _generateCurlCommand(RequestOptions options) {
    final buffer = StringBuffer();
    buffer.write('curl -X ${options.method}');

    options.headers.forEach((key, value) {
      if (key.toLowerCase() != 'content-length') {
        buffer.write(' \\\n  -H "$key: $value"');
      }
    });

    if (options.data != null) {
      String dataString;
      if (options.data is String) {
        dataString = options.data as String;
      } else if (options.data is Map || options.data is List) {
        dataString = const JsonEncoder.withIndent('  ').convert(options.data);
      } else {
        dataString = options.data.toString();
      }
      dataString = dataString.replaceAll("'", "'\\''");
      buffer.write(" \\\n  -d '$dataString'");
    }

    buffer.write(' \\\n  "${options.uri}"');

    return buffer.toString();
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final curlCommand = _generateCurlCommand(options);
    Logger.d(
      'Request : ${options.uri}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Header: ${options.headers}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Request Body: ${options.data}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'cURL Command:\n$curlCommand\n',
    );
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    var prettyString = const JsonEncoder.withIndent(
      '  ',
    ).convert(response.data);
    Logger.d(
      'URI: ${response.realUri}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Method: ${response.requestOptions.method}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Status code: ${response.statusCode}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Header: ${response.requestOptions.headers}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Response : $prettyString\n',
    );

    return handler.next(response);
  }

  String _formatErrorData(dynamic errorData) {
    if (errorData == null) return 'No error data';

    try {
      if (errorData is Map || errorData is List) {
        return const JsonEncoder.withIndent('  ').convert(errorData);
      } else if (errorData is String) {
        return errorData;
      } else {
        return errorData.toString();
      }
    } catch (e) {
      return errorData.toString();
    }
  }

  String _getErrorMessage(DioException err) {
    if (err.response?.data != null) {
      final data = err.response!.data;
      if (data is Map) {
        if (data['message'] != null) {
          final message = data['message'];
          if (message is List) {
            return message.join('\n');
          } else if (message is String) {
            return message;
          }
        }
        if (data['error'] != null) {
          return data['error'].toString();
        }
      }
    }

    final statusMessage = err.response?.statusMessage;
    if (statusMessage != null && statusMessage.isNotEmpty) {
      return statusMessage;
    }
    return err.type.toString().replaceAll('DioExceptionType.', '');
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final uri = err.response?.realUri ?? err.requestOptions.uri;
    final method =
        err.response?.requestOptions.method ?? err.requestOptions.method;
    final statusCode = err.response?.statusCode ?? 'N/A';
    final errorMessage = _getErrorMessage(err);
    final formattedErrorData = _formatErrorData(err.response?.data);

    Logger.e(
      'URI: $uri\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Method: $method\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Status code: $statusCode\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Error Message: $errorMessage\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Error Response:\n$formattedErrorData\n',
    );

    if (err.response?.statusCode == 401 && !uri.path.contains('/login')) {
      Logger.e('401 Unauthorized detected - Logging out user');
      Util.clearAuthAndNavigateToLogin();
    }

    return handler.next(err);
  }
}
