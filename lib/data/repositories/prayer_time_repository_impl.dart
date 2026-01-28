import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/data/datasources/prayer_time_remote_data_source.dart';
import 'package:ramadan_apps/domain/repositories/prayer_time_repository.dart';

class PrayerTimeRepositoryImpl implements PrayerTimeRepository {
  final PrayerTimeRemoteDataSource remoteDataSource;

  PrayerTimeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Exception, List<String>>> getProvinsiList() async {
    try {
      final result = await remoteDataSource.getProvinsiList();
      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<String>>> getKabKotaList(
    String provinsi,
  ) async {
    try {
      final result = await remoteDataSource.getKabKotaList(provinsi);
      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
