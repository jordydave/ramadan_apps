class BaseResponse {
  final bool success;
  final num statusCode;
  final dynamic message;
  final dynamic data;

  BaseResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    dynamic messageValue = json['message'];

    if (messageValue is List) {
      messageValue = messageValue.map((e) => e.toString()).toList();
    } else if (messageValue != null) {
      messageValue = messageValue.toString();
    }

    return BaseResponse(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: messageValue,
      data: json['data'],
    );
  }

  String? get messageAsString {
    if (message == null) return null;
    if (message is List) {
      return (message as List).join('\n');
    }
    return message.toString();
  }

  List<String> get messageAsList {
    if (message == null) return [];
    if (message is List) {
      return (message as List).map((e) => e.toString()).toList();
    }
    return [message.toString()];
  }
}
