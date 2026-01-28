import 'package:dartz/dartz.dart';

abstract class PrayerTimeRepository {
  Future<Either<Exception, List<String>>> getProvinsiList();
}
