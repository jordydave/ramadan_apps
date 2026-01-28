import 'package:ramadan_apps/data/dto/response/base_response/base_response.dart';
import 'package:ramadan_apps/data/dto/surah_detail_dto.dart';
import 'package:ramadan_apps/data/dto/surah_dto.dart';
import 'package:ramadan_apps/data/dto/tafsir_dto.dart';
import 'package:ramadan_apps/network/http_util/http_util.dart';

class SurahRemoteDataSource {
  final HttpUtil httpUtil;

  SurahRemoteDataSource({required this.httpUtil});

  Future<List<SurahDto>> getAllSurah() async {
    final response = await httpUtil.get(uri: 'https://equran.id/api/v2/surat');

    return response.fold((error) => throw Exception(error.messageAsString), (
      data,
    ) {
      if (data is BaseResponse) {
        if (data.data is List) {
          return (data.data as List)
              .map((e) => SurahDto.fromJson(e as Map<String, dynamic>))
              .toList();
        }
      } else if (data is Map<String, dynamic> && data['data'] is List) {
        return (data['data'] as List)
            .map((e) => SurahDto.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    });
  }

  Future<SurahDetailDto> getSurahDetail(int id) async {
    final response = await httpUtil.get(
      uri: 'https://equran.id/api/v2/surat/$id',
    );

    return response.fold((error) => throw Exception(error.messageAsString), (
      data,
    ) {
      if (data is BaseResponse) {
        if (data.data is Map<String, dynamic>) {
          return SurahDetailDto.fromJson(data.data as Map<String, dynamic>);
        }
      } else if (data is Map<String, dynamic> &&
          data['data'] is Map<String, dynamic>) {
        return SurahDetailDto.fromJson(data['data'] as Map<String, dynamic>);
      }
      throw Exception('Invalid data format');
    });
  }

  Future<List<TafsirDto>> getTafsir(int id) async {
    final response = await httpUtil.get(
      uri: 'https://equran.id/api/v2/tafsir/$id',
    );

    return response.fold((error) => throw Exception(error.messageAsString), (
      data,
    ) {
      if (data is BaseResponse) {
        if (data.data is Map<String, dynamic>) {
          final mapData = data.data as Map<String, dynamic>;
          final tafsirList = mapData['tafsir'] as List<dynamic>?;
          if (tafsirList != null) {
            return tafsirList
                .map((e) => TafsirDto.fromJson(e as Map<String, dynamic>))
                .toList();
          }
        }
      } else if (data is Map<String, dynamic> &&
          data['data'] is Map<String, dynamic>) {
        final tafsirList = data['data']['tafsir'] as List<dynamic>?;
        if (tafsirList != null) {
          return tafsirList
              .map((e) => TafsirDto.fromJson(e as Map<String, dynamic>))
              .toList();
        }
      }
      throw Exception('Invalid data format for Tafsir');
    });
  }
}
