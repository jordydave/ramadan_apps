import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/domain/entities/tafsir.dart';
import 'package:ramadan_apps/domain/repositories/surah_repository.dart';

abstract class GetTafsirUseCase {
  Future<Either<Exception, List<Tafsir>>> call(int id);
}

class GetTafsirUseCaseImpl implements GetTafsirUseCase {
  final SurahRepository repository;

  GetTafsirUseCaseImpl({required this.repository});

  @override
  Future<Either<Exception, List<Tafsir>>> call(int id) async {
    return await repository.getTafsir(id);
  }
}
