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
}
