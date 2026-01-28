import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/domain/repositories/prayer_time_repository.dart';

class GetProvinsiListUseCase {
  final PrayerTimeRepository repository;

  GetProvinsiListUseCase({required this.repository});

  Future<Either<Exception, List<String>>> call() {
    return repository.getProvinsiList();
  }
}
