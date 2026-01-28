import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/domain/entities/surah_detail.dart';
import 'package:ramadan_apps/domain/repositories/surah_repository.dart';

abstract class GetSurahDetailUseCase {
  Future<Either<Exception, SurahDetail>> call(int id);
}

class GetSurahDetailUseCaseImpl implements GetSurahDetailUseCase {
  final SurahRepository repository;

  GetSurahDetailUseCaseImpl({required this.repository});

  @override
  Future<Either<Exception, SurahDetail>> call(int id) async {
    return await repository.getSurahDetail(id);
  }
}
