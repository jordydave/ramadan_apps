import 'package:ramadan_apps/data/dto/response/base_response/base_response.dart';

class SubmissionResponse extends BaseResponse {
  final dynamic meta;

  SubmissionResponse({
    super.success = true,
    super.statusCode = 200,
    super.message = '',
    super.data,
    this.meta,
  });

  factory SubmissionResponse.fromJson(Map<String, dynamic> json) {
    return SubmissionResponse(
      data: json['data'],
      meta: json['meta'],
      success: json['success'] ?? true,
      statusCode: json['statusCode'] ?? 200,
      message: json['message'] ?? '',
    );
  }

  factory SubmissionResponse.fromBaseResponse(BaseResponse baseResponse) {
    return SubmissionResponse(
      data: baseResponse.data,
      meta: null,
      success: baseResponse.success,
      statusCode: baseResponse.statusCode,
      message: baseResponse.message,
    );
  }
}
