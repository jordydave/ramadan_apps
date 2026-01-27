import 'package:ramadan_apps/data/dto/response/base_response/base_response.dart';

class ReasonResponse extends BaseResponse {
  ReasonResponse({
    super.success = true,
    super.statusCode = 200,
    super.message = '',
    super.data,
  });

  factory ReasonResponse.fromJson(Map<String, dynamic> json) {
    return ReasonResponse(
      data: json['data'],
      success: json['success'] ?? true,
      statusCode: json['statusCode'] ?? 200,
      message: json['message'] ?? '',
    );
  }

  factory ReasonResponse.fromBaseResponse(BaseResponse baseResponse) {
    return ReasonResponse(
      data: baseResponse.data,
      success: baseResponse.success,
      statusCode: baseResponse.statusCode,
      message: baseResponse.message,
    );
  }

  List<ReasonData> get reasons {
    if (data is List) {
      return (data as List)
          .map((item) => ReasonData.fromJson(item as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}

class ReasonData {
  final int id;
  final String nama;
  final String kategori;
  final bool requireAttachment;

  ReasonData({
    this.id = 0,
    this.nama = '',
    this.kategori = '',
    this.requireAttachment = false,
  });

  factory ReasonData.fromJson(Map<String, dynamic> json) {
    return ReasonData(
      id: json['id'] ?? 0,
      nama: json['nama'] ?? '',
      kategori: json['kategori'] ?? '',
      requireAttachment: json['requireAttachment'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'kategori': kategori,
      'requireAttachment': requireAttachment,
    };
  }
}
