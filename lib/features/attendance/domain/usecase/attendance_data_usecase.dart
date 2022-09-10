import 'package:dartz/dartz.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/entity/attendance_data_entity.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/repository/attendance_data_repository_impl.dart';
import 'package:orio_attendance_app_flutter/shared/error/failures.dart';
import 'package:orio_attendance_app_flutter/shared/params/attendance_data_params.dart';
import 'package:orio_attendance_app_flutter/shared/usecase/usecase.dart';

class AttendanceDataUseCase
    extends UseCase<List<AttendanceData>, AttendanceDataParams> {
  final AttendanceDataRepositoryImpl repository;

  AttendanceDataUseCase({required this.repository});

  @override
  Future<Either<Failure, List<AttendanceData>>> call(
      AttendanceDataParams params) {
    return repository.get(token: params.token, date: params.date);
  }
}
