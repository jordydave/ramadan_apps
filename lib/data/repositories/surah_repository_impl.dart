import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/data/datasources/surah_local_data_source.dart';
import 'package:ramadan_apps/data/datasources/surah_remote_data_source.dart';
import 'package:ramadan_apps/domain/entities/surah.dart';
import 'package:ramadan_apps/domain/entities/surah_detail.dart';
import 'package:ramadan_apps/domain/entities/tafsir.dart';
import 'package:ramadan_apps/domain/repositories/surah_repository.dart';

class SurahRepositoryImpl implements SurahRepository {
  final SurahRemoteDataSource remoteDataSource;
  final SurahLocalDataSource localDataSource;

  SurahRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Exception, List<Surah>>> getAllSurah({
    bool forceRefresh = false,
  }) async {
    try {
      if (!forceRefresh && await localDataSource.isCacheValid()) {
        final cachedData = await localDataSource.getCachedSurahs();
        if (cachedData != null) {
          return Right(cachedData.map((e) => e.toEntity()).toList());
        }
      }

      final dtos = await remoteDataSource.getAllSurah();
      await localDataSource.cacheSurahs(dtos);
      final entities = dtos.map((e) => e.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, SurahDetail>> getSurahDetail(int id) async {
    try {
      final dto = await remoteDataSource.getSurahDetail(id);
      return Right(dto.toEntity());
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<Tafsir>>> getTafsir(int id) async {
    try {
      final dtos = await remoteDataSource.getTafsir(id);
      return Right(dtos.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
