part of 'http_util_impl.dart';

mixin class _Extender {
  final _dio = Dio()..httpClientAdapter = HTTPAdapter(preserveHeaderCase: true);

  Map<String, dynamic> get _defaultHeader {
    Map<String, String> headers = {};
    headers['Content-Type'] = 'application/json';
    headers['accept'] = 'application/json';

    return headers;
  }

  Map<String, dynamic> _setHeader(Map<String, dynamic>? headers) {
    Map<String, dynamic> httpHeaders = _defaultHeader;
    if (headers != null) {
      headers.forEach((key, value) {
        httpHeaders[key] = value;
      });
    }
    return httpHeaders;
  }

  Either<BaseResponse, BaseResponse> _dioResponse(Response<dynamic> response) {
    if (response.statusCode == null ||
        response.statusCode! < 200 ||
        response.statusCode! > 299) {
      return Left(
        BaseResponse(
          success: false,
          statusCode: response.statusCode ?? 400,
          message: response.data?['message'] ?? response.statusMessage,
          data: response.data,
        ),
      );
    } else {
      return Right(BaseResponse.fromJson(response.data));
    }
  }

  BaseResponse _dioCatch(DioException e) {
    if (e.response?.data is Map) {
      if (e.response?.data['status'] != null) {
        if (e.response?.data['status'] is Map) {
          return BaseResponse(
            success: false,
            statusCode: e.response?.statusCode ?? 400,
            message: e.response?.data?['message'] ?? e.response?.statusMessage,
            data: e.response?.data,
          );
        } else if (e.response?.data['status'] is int) {
          return BaseResponse(
            success: false,
            statusCode: e.response?.statusCode ?? 400,
            message: e.response?.data?['message'] ?? e.response?.statusMessage,
            data: e.response?.data,
          );
        } else {
          return BaseResponse(
            success: false,
            statusCode: e.response?.statusCode ?? 400,
            message: e.response?.data?['message'] ?? e.response?.statusMessage,
            data: e.response?.data,
          );
        }
      } else {
        return BaseResponse(
          success: false,
          statusCode: e.response?.statusCode ?? 400,
          message: e.response?.data?['message'] ?? e.response?.statusMessage,
          data: e.response?.data,
        );
      }
    } else {
      return BaseResponse(
        success: false,
        statusCode: e.response?.statusCode ?? 400,
        message: e.response?.data?['message'] ?? e.response?.statusMessage,
        data: e.response?.data,
      );
    }
  }

  String? internalServerErrorStringFormatter(String? errorText) {
    if (errorText == 'error.internal.server') {
      return "We're experiencing a temporary system error. Please try again later. Thank you for your patience";
    } else {
      return errorText;
    }
  }

  String get httpErrorDefault {
    return "We're experiencing a temporary system error. Please try again later. Thank you for your patience";
  }
}
