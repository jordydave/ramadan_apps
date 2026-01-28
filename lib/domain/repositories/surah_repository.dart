import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/domain/entities/surah.dart';

abstract class SurahRepository {
  Future<Either<Exception, List<Surah>>> getAllSurah();
}
