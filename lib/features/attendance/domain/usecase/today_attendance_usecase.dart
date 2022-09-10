import 'package:dartz/dartz.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/entity/attendance_data_entity.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/repository/attendance_data_repository_impl.dart';
import 'package:orio_attendance_app_flutter/shared/error/failures.dart';
import 'package:orio_attendance_app_flutter/shared/params/token_params.dart';
import 'package:orio_attendance_app_flutter/shared/usecase/usecase.dart';

class TodayAttendanceUseCase extends UseCase<AttendanceData, TokenParams> {
  final AttendanceDataRepositoryImpl repository;

  TodayAttendanceUseCase({required this.repository});

  @override
  Future<Either<Failure, AttendanceData>> call(TokenParams params) {
    return repository.getTodayAttendance(token: params.token);
  }
}
