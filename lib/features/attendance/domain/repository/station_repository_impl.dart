import 'package:dartz/dartz.dart';
import 'package:orio_attendance_app_flutter/features/attendance/data/datasource/station_remote_datasource.dart';
import 'package:orio_attendance_app_flutter/features/attendance/data/mapper/station_mapper.dart';
import 'package:orio_attendance_app_flutter/features/attendance/data/model/station_model.dart';
import 'package:orio_attendance_app_flutter/features/attendance/data/repository/station_repository.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/entity/station_entitiy.dart';
import 'package:orio_attendance_app_flutter/shared/error/failures.dart';

class StationRepositoryImpl extends StationRepository {
  late StationRemoteDataSource _remoteDataSource;
  late StationMapper _mapper;

  StationRepositoryImpl({
    required StationRemoteDataSource stationRemoteDataSource,
    required StationMapper stationMapper,
  }) {
    _remoteDataSource = stationRemoteDataSource;
    _mapper = stationMapper;
  }

  @override
  Future<Either<Failure, List<Station>>> get({required String token}) async {
    try {
      List<StationModel> stationModel = await _remoteDataSource.get(token);

      List<Station> result =
          stationModel.map((data) => _mapper.mapModeltoEntity(data)).toList();

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
