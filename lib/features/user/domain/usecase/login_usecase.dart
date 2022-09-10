import 'package:dartz/dartz.dart';
import 'package:orio_attendance_app_flutter/features/user/domain/entity/user_entity.dart';
import 'package:orio_attendance_app_flutter/features/user/domain/repository/user_repository_impl.dart';
import 'package:orio_attendance_app_flutter/shared/error/failures.dart';
import 'package:orio_attendance_app_flutter/shared/params/user_params.dart';
import 'package:orio_attendance_app_flutter/shared/usecase/usecase.dart';

class LoginUseCase extends UseCase<User, UserParams> {
  final UserRepositoryImpl repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, User>> call(UserParams params) {
    return repository.login(empId: params.empId);
  }
}
