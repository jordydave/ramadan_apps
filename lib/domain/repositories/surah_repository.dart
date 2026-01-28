import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/domain/entities/surah.dart';
import 'package:ramadan_apps/domain/entities/surah_detail.dart';

abstract class SurahRepository {
  Future<Either<Exception, List<Surah>>> getAllSurah();
  Future<Either<Exception, SurahDetail>> getSurahDetail(int id);
}
