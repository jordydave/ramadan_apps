import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/domain/repositories/prayer_time_repository.dart';

class GetKabKotaListUseCase {
  final PrayerTimeRepository repository;

  GetKabKotaListUseCase({required this.repository});

  Future<Either<Exception, List<String>>> call(String provinsi) {
    return repository.getKabKotaList(provinsi);
  }
}
