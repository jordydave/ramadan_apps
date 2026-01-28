import 'package:ramadan_apps/network/http_util/http_util.dart';

abstract class PrayerTimeRemoteDataSource {
  Future<List<String>> getProvinsiList();
}

class PrayerTimeRemoteDataSourceImpl implements PrayerTimeRemoteDataSource {
  final HttpUtil httpUtil;

  PrayerTimeRemoteDataSourceImpl({required this.httpUtil});

  @override
  Future<List<String>> getProvinsiList() async {
    final response = await httpUtil.get(
      uri: 'https://equran.id/api/v2/shalat/provinsi',
    );

    return response.fold((error) => throw Exception(error.messageAsString), (
      data,
    ) {
      if (data is Map<String, dynamic> && data['data'] is List) {
        return (data['data'] as List).map((e) => e.toString()).toList();
      }
      // Handle BaseResponse if necessary, matching DoaRemoteDataSource pattern
      return [];
    });
  }
}
