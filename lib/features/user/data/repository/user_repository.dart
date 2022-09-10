import 'package:dartz/dartz.dart';
import 'package:orio_attendance_app_flutter/features/user/domain/entity/user_entity.dart';
import 'package:orio_attendance_app_flutter/shared/error/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> login({
    required String empId,
  });
}
