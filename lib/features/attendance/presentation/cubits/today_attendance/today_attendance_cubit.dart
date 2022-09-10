import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/entity/attendance_data_entity.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/usecase/today_attendance_usecase.dart';
import 'package:orio_attendance_app_flutter/shared/error/failures.dart';
import 'package:orio_attendance_app_flutter/shared/params/token_params.dart';

part 'today_attendance_state.dart';

class TodayAttendanceCubit extends Cubit<TodayAttendanceState>
    with HydratedMixin {
  final TodayAttendanceUseCase todayAttendanceUseCase;
  TodayAttendanceCubit({
    required this.todayAttendanceUseCase,
  }) : super(TodayAttendanceState.initial());

  Future<void> get(String token) async {
    emit(state.copyWith(
      status: TodayAttendanceStatus.loading,
    ));
    final Either<Failure, AttendanceData> attendance =
        await todayAttendanceUseCase.call(TokenParams(token: token));

    attendance.fold(
      (Failure failure) {
        emit(state.copyWith(
          status: TodayAttendanceStatus.loaded,
        ));
      },
      (AttendanceData attendance) {
        emit(state.copyWith(
          attendanceData: attendance,
          status: TodayAttendanceStatus.loaded,
        ));
      },
    );
  }

  void checkSameDay() {
    DateTime now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);

    if (state.attendanceData.date != formattedDate) {
      emit(state.copyWith(
        attendanceData: AttendanceData.initial(),
      ));
    }
  }

  void setToInitial() {
    emit(state.copyWith(attendanceData: AttendanceData.initial()));
  }

  @override
  TodayAttendanceState? fromJson(Map<String, dynamic> json) {
    return TodayAttendanceState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TodayAttendanceState state) {
    return state.toMap();
  }
}
