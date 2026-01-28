import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/domain/entities/doa.dart';
import 'package:ramadan_apps/domain/repositories/doa_repository.dart';

class GetDoaListUseCase {
  final DoaRepository repository;

  GetDoaListUseCase({required this.repository});

  Future<Either<Exception, List<Doa>>> call() async {
    return repository.getDoaList();
  }
}
