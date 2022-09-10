import 'package:dartz/dartz.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/entity/attendance_data_entity.dart';
import 'package:orio_attendance_app_flutter/shared/error/failures.dart';

abstract class AttendanceDataRepository {
  Future<Either<Failure, List<AttendanceData>>> get(
      {required String token, required String date});

  Future<Either<Failure, AttendanceData>> getTodayAttendance(
      {required String token});
}
