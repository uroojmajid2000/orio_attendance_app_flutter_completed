import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orio_attendance_app_flutter/features/attendance/data/datasource/attendance_data_remote_datasource.dart';
import 'package:orio_attendance_app_flutter/features/attendance/data/datasource/station_remote_datasource.dart';
import 'package:orio_attendance_app_flutter/features/attendance/data/mapper/attendance_data_mapper.dart';
import 'package:orio_attendance_app_flutter/features/attendance/data/mapper/station_mapper.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/repository/attendance_data_repository_impl.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/repository/station_repository_impl.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/usecase/attendance_data_usecase.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/usecase/station_usecase.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/usecase/today_attendance_usecase.dart';
import 'package:orio_attendance_app_flutter/features/user/data/datasource/user_remote_datasource.dart';
import 'package:orio_attendance_app_flutter/features/user/data/mapper/user_mapper.dart';
import 'package:orio_attendance_app_flutter/features/user/domain/repository/user_repository_impl.dart';
import 'package:orio_attendance_app_flutter/features/user/domain/usecase/login_usecase.dart';

class RepositoryProviders {
  static List<RepositoryProvider> providers = [
    // Login
    RepositoryProvider<LoginUseCase>(
      create: (context) => LoginUseCase(
        repository: UserRepositoryImpl(
            userMapper: UserMapper(),
            userRemoteDataSource: UserRemoteDataSource()),
      ),
    ),
    // Stations
    RepositoryProvider<StationUseCase>(
      create: (context) => StationUseCase(
        repository: StationRepositoryImpl(
            stationMapper: StationMapper(),
            stationRemoteDataSource: StationRemoteDataSource()),
      ),
    ),
    // Attendance Data
    RepositoryProvider<AttendanceDataUseCase>(
      create: (context) => AttendanceDataUseCase(
        repository: AttendanceDataRepositoryImpl(
            attendanceDataMapper: AttendanceDataMapper(),
            attendanceDataRemoteDataSource: AttendanceDataRemoteDataSource()),
      ),
    ),
    RepositoryProvider<TodayAttendanceUseCase>(
      create: (context) => TodayAttendanceUseCase(
        repository: AttendanceDataRepositoryImpl(
            attendanceDataMapper: AttendanceDataMapper(),
            attendanceDataRemoteDataSource: AttendanceDataRemoteDataSource()),
      ),
    ),
  ];
}
