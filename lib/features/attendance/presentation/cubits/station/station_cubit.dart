import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/entity/station_entitiy.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/usecase/station_usecase.dart';
import 'package:orio_attendance_app_flutter/shared/error/failures.dart';
import 'package:orio_attendance_app_flutter/shared/params/token_params.dart';

part 'station_state.dart';

class StationCubit extends Cubit<StationState> with HydratedMixin {
  final StationUseCase stationUseCase;

  StationCubit({
    required this.stationUseCase,
  }) : super(StationState.initial());

  @override
  StationState? fromJson(Map<String, dynamic> json) {
    return StationState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(StationState state) {
    return state.toMap();
  }

  Future<void> get(String token) async {
    final Either<Failure, List<Station>> stationData =
        await stationUseCase.call(TokenParams(token: token));

    stationData.fold(
      (Failure failure) {},
      (List<Station> stations) {
        emit(state.copyWith(stations: stations));
      },
    );
  }
}
