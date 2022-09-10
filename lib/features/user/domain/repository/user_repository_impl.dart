import 'package:dartz/dartz.dart';
import 'package:orio_attendance_app_flutter/features/user/data/datasource/user_remote_datasource.dart';
import 'package:orio_attendance_app_flutter/features/user/data/mapper/user_mapper.dart';
import 'package:orio_attendance_app_flutter/features/user/data/model/user_model.dart';
import 'package:orio_attendance_app_flutter/features/user/data/repository/user_repository.dart';
import 'package:orio_attendance_app_flutter/features/user/domain/entity/user_entity.dart';
import 'package:orio_attendance_app_flutter/shared/error/failures.dart';

class UserRepositoryImpl extends UserRepository {
  late UserRemoteDataSource _remoteDataSource;
  late UserMapper _mapper;

  UserRepositoryImpl({
    required UserRemoteDataSource userRemoteDataSource,
    required UserMapper userMapper,
  }) {
    _remoteDataSource = userRemoteDataSource;
    _mapper = userMapper;
  }

  @override
  Future<Either<Failure, User>> login({
    required String empId,
  }) async {
    try {
      UserModel userModel = await _remoteDataSource.login(
        empId,
      );

      User result = _mapper.mapModeltoEntity(userModel);

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
