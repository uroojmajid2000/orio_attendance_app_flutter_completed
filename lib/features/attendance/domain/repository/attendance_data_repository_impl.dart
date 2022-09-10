import 'package:dartz/dartz.dart';
import 'package:orio_attendance_app_flutter/features/attendance/data/datasource/attendance_data_remote_datasource.dart';
import 'package:orio_attendance_app_flutter/features/attendance/data/mapper/attendance_data_mapper.dart';
import 'package:orio_attendance_app_flutter/features/attendance/data/model/attendance_data_model.dart';
import 'package:orio_attendance_app_flutter/features/attendance/data/repository/attendance_data_repository.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/entity/attendance_data_entity.dart';
import 'package:orio_attendance_app_flutter/shared/error/failures.dart';

class AttendanceDataRepositoryImpl extends AttendanceDataRepository {
  late AttendanceDataRemoteDataSource _remoteDataSource;
  late AttendanceDataMapper _mapper;

  AttendanceDataRepositoryImpl({
    required AttendanceDataRemoteDataSource attendanceDataRemoteDataSource,
    required AttendanceDataMapper attendanceDataMapper,
  }) {
    _remoteDataSource = attendanceDataRemoteDataSource;
    _mapper = attendanceDataMapper;
  }

  @override
  Future<Either<Failure, List<AttendanceData>>> get(
      {required String token, required String date}) async {
    try {
      List<AttendanceDataModel> attendanceDataModel =
          await _remoteDataSource.getAttendanceData(token, date);

      List<AttendanceData> result = attendanceDataModel
          .map((data) => _mapper.mapModeltoEntity(data))
          .toList();

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AttendanceData>> getTodayAttendance(
      {required String token}) async {
    try {
      AttendanceDataModel attendanceDataModel =
          await _remoteDataSource.getTodayAttendance(token);

      AttendanceData result = _mapper.mapModeltoEntity(attendanceDataModel);

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
