import 'package:dartz/dartz.dart';
import 'package:ramadan_apps/data/dto/response/base_response/base_response.dart';
import 'package:ramadan_apps/domain/entities/submission/reason.dart';

abstract class ReasonUsecase {
  Future<Either<BaseResponse, ReasonList>> call({required String accessToken});
}
