import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/domain/entities/doa.dart';

abstract class DoaRepository {
  Future<Either<Exception, List<Doa>>> getDoaList();
  Future<Either<Exception, Doa>> getDoaDetail(int id);
}
