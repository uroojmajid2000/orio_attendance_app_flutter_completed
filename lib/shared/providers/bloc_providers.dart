import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/usecase/attendance_data_usecase.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/usecase/station_usecase.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/usecase/today_attendance_usecase.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/cubits/attendance_data/attendance_data_cubit.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/cubits/station/station_cubit.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/cubits/today_attendance/today_attendance_cubit.dart';
import 'package:orio_attendance_app_flutter/features/user/domain/usecase/login_usecase.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/cubit/user_cubit.dart';

class BlocProviders {
  static List<BlocProvider> providers = [
    // Login
    BlocProvider<UserCubit>(
      create: (context) => UserCubit(
        loginUseCase: context.read<LoginUseCase>(),
      ),
    ),
    // Station
    BlocProvider<StationCubit>(
      create: (context) => StationCubit(
        stationUseCase: context.read<StationUseCase>(),
      ),
    ),
    // Attendance Data
    BlocProvider<AttendanceDataCubit>(
      create: (context) => AttendanceDataCubit(
        attendanceDataUseCase: context.read<AttendanceDataUseCase>(),
      ),
    ),
    BlocProvider<TodayAttendanceCubit>(
      create: (context) => TodayAttendanceCubit(
        todayAttendanceUseCase: context.read<TodayAttendanceUseCase>(),
      ),
    ),
  ];
}
