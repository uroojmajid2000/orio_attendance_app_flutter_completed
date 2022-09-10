import 'package:dartz/dartz.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/entity/station_entitiy.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/repository/station_repository_impl.dart';
import 'package:orio_attendance_app_flutter/shared/error/failures.dart';
import 'package:orio_attendance_app_flutter/shared/params/token_params.dart';
import 'package:orio_attendance_app_flutter/shared/usecase/usecase.dart';

class StationUseCase extends UseCase<List<Station>, TokenParams> {
  final StationRepositoryImpl repository;

  StationUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Station>>> call(TokenParams params) {
    return repository.get(token: params.token);
  }
}
