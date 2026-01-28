import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/data/datasources/surah_remote_data_source.dart';
import 'package:ramadan_apps/domain/entities/surah.dart';
import 'package:ramadan_apps/domain/repositories/surah_repository.dart';

class SurahRepositoryImpl implements SurahRepository {
  final SurahRemoteDataSource remoteDataSource;

  SurahRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Exception, List<Surah>>> getAllSurah() async {
    try {
      final dtos = await remoteDataSource.getAllSurah();
      final entities = dtos.map((e) => e.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
