import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/data/datasources/doa_remote_data_source.dart';
import 'package:ramadan_apps/domain/entities/doa.dart';
import 'package:ramadan_apps/domain/repositories/doa_repository.dart';

class DoaRepositoryImpl implements DoaRepository {
  final DoaRemoteDataSource dataSource;

  DoaRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Exception, List<Doa>>> getDoaList() async {
    try {
      final result = await dataSource.getDoaList();
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, Doa>> getDoaDetail(int id) async {
    try {
      final result = await dataSource.getDoaDetail(id);
      return Right(result.toEntity());
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
