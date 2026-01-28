import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/domain/entities/surah.dart';
import 'package:ramadan_apps/domain/entities/surah_detail.dart';
import 'package:ramadan_apps/domain/entities/tafsir.dart';

abstract class SurahRepository {
  Future<Either<Exception, List<Surah>>> getAllSurah({
    bool forceRefresh = false,
  });
  Future<Either<Exception, SurahDetail>> getSurahDetail(int id);
  Future<Either<Exception, List<Tafsir>>> getTafsir(int id);
}
