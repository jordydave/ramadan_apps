import 'package:dartz/dartz.dart';

abstract class PrayerTimeRepository {
  Future<Either<Exception, List<String>>> getProvinsiList();
  Future<Either<Exception, List<String>>> getKabKotaList(String provinsi);
}
