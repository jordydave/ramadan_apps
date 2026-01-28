import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/domain/entities/surah.dart';

abstract class GetAllSurahUseCase {
  Future<Either<Exception, List<Surah>>> call();
}
