import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/domain/entities/doa.dart';
import 'package:ramadan_apps/domain/repositories/doa_repository.dart';

class GetDoaDetailUseCase {
  final DoaRepository repository;

  GetDoaDetailUseCase({required this.repository});

  Future<Either<Exception, Doa>> call(int id) async {
    return repository.getDoaDetail(id);
  }
}
