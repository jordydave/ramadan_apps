import 'package:ramadan_apps/data/dto/doa_dto.dart';
import 'package:ramadan_apps/data/dto/response/base_response/base_response.dart';
import 'package:ramadan_apps/network/http_util/http_util.dart';

class DoaRemoteDataSource {
  final HttpUtil httpUtil;

  DoaRemoteDataSource({required this.httpUtil});

  Future<List<DoaDto>> getDoaList() async {
    final response = await httpUtil.get(uri: 'https://equran.id/api/doa');

    return response.fold((error) => throw Exception(error.messageAsString), (
      data,
    ) {
      if (data is BaseResponse) {
        if (data.data is List) {
          return (data.data as List)
              .map((e) => DoaDto.fromJson(e as Map<String, dynamic>))
              .toList();
        }
      } else if (data is Map<String, dynamic> && data['data'] is List) {
        return (data['data'] as List)
            .map((e) => DoaDto.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    });
  }

  Future<DoaDto> getDoaDetail(int id) async {
    final response = await httpUtil.get(uri: 'https://equran.id/api/doa/$id');

    return response.fold((error) => throw Exception(error.messageAsString), (
      data,
    ) {
      if (data is BaseResponse) {
        if (data.data is Map<String, dynamic>) {
          return DoaDto.fromJson(data.data as Map<String, dynamic>);
        }
      } else if (data is Map<String, dynamic> &&
          data['data'] is Map<String, dynamic>) {
        return DoaDto.fromJson(data['data'] as Map<String, dynamic>);
      }
      throw Exception('Invalid data format');
    });
  }
}
