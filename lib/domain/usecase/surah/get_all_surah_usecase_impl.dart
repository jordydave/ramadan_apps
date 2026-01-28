import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/domain/entities/surah.dart';
import 'package:ramadan_apps/domain/repositories/surah_repository.dart';
import 'package:ramadan_apps/domain/usecase/surah/get_all_surah_usecase.dart';

class GetAllSurahUseCaseImpl implements GetAllSurahUseCase {
  final SurahRepository repository;

  GetAllSurahUseCaseImpl({required this.repository});

  @override
  Future<Either<Exception, List<Surah>>> call({
    bool forceRefresh = false,
  }) async {
    return await repository.getAllSurah(forceRefresh: forceRefresh);
  }
}
