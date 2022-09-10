import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:orio_attendance_app_flutter/features/user/domain/entity/user_entity.dart';
import 'package:orio_attendance_app_flutter/features/user/domain/usecase/login_usecase.dart';
import 'package:orio_attendance_app_flutter/shared/error/failures.dart';
import 'package:orio_attendance_app_flutter/shared/params/user_params.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> with HydratedMixin {
  final LoginUseCase loginUseCase;

  UserCubit({
    required this.loginUseCase,
  }) : super(UserState.initial());

  Future<void> login(String empId) async {
    emit(state.copyWith(status: UserStatus.loading));

    Either<Failure, User> user =
        await loginUseCase.call(UserParams(empId: empId));

    user.fold(
      (Failure failure) {
        emit(state.copyWith(
          status: UserStatus.error,
        ));
      },
      (User user) {
        emit(state.copyWith(
          status: UserStatus.loaded,
          user: user,
          isOtpVerified: false,
        ));
      },
    );
  }

  void logout() {
    emit(state.copyWith(
      status: UserStatus.initial,
      user: User.initial(),
      isOtpVerified: false,
    ));
  }

  bool isLoggedIn() {
    return state.isOtpVerified;
  }

  void verifyOtp() {
    emit(state.copyWith(isOtpVerified: true));
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    return UserState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    return state.toMap();
  }
}
