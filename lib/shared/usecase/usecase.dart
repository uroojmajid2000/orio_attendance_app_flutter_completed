import 'package:dartz/dartz.dart';
import 'package:orio_attendance_app_flutter/shared/error/failures.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}
