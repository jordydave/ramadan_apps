import 'package:ramadan_apps/data/dto/surah_dto.dart';
import 'package:ramadan_apps/network/http_util/http_util.dart';

class SurahRemoteDataSource {
  final HttpUtil httpUtil;

  SurahRemoteDataSource({required this.httpUtil});

  Future<List<SurahDto>> getAllSurah() async {
    final response = await httpUtil.get(uri: 'https://equran.id/api/v2/surat');

    return response.fold((error) => throw Exception(error.messageAsString), (
      data,
    ) {
      if (data is Map<String, dynamic> && data['data'] is List) {
        return (data['data'] as List)
            .map((e) => SurahDto.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    });
  }
}
