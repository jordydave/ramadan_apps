import 'package:ramadan_apps/data/dto/response/base_response/base_response.dart';

class BaseResponseException implements Exception {
  final BaseResponse baseResponse;

  BaseResponseException(this.baseResponse);

  @override
  String toString() {
    return baseResponse.messageAsString ?? 'An error occurred';
  }
}
