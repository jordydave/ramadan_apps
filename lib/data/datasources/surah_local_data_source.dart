import 'package:get_storage/get_storage.dart';
import 'package:ramadan_apps/data/dto/surah_dto.dart';

class SurahLocalDataSource {
  final GetStorage _storage = GetStorage();
  static const String _surahKey = 'surah_list_cache';
  static const String _timestampKey = 'surah_list_timestamp';
  static const int _cacheDuration = 24 * 60 * 60 * 1000; // 1 day in ms

  Future<void> cacheSurahs(List<SurahDto> surahs) async {
    final jsonList = surahs.map((e) => e.toJson()).toList();
    await _storage.write(_surahKey, jsonList);
    await _storage.write(_timestampKey, DateTime.now().millisecondsSinceEpoch);
  }

  Future<List<SurahDto>?> getCachedSurahs() async {
    final cachedData = _storage.read<List<dynamic>>(_surahKey);
    if (cachedData != null) {
      return cachedData
          .map((e) => SurahDto.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return null;
  }

  Future<bool> isCacheValid() async {
    if (!_storage.hasData(_surahKey) || !_storage.hasData(_timestampKey)) {
      return false;
    }

    final timestamp = _storage.read<int>(_timestampKey);
    if (timestamp == null) return false;

    final cachedTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final currentTime = DateTime.now();

    return currentTime.difference(cachedTime).inMilliseconds < _cacheDuration;
  }
}
