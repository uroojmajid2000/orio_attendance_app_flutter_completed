import 'package:orio_attendance_app_flutter/features/attendance/data/model/station_model.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/entity/station_entitiy.dart';
import 'package:orio_attendance_app_flutter/shared/mapper/mapper.dart';

class StationMapper extends Mapper<Station, StationModel> {
  @override
  Station mapModeltoEntity(StationModel model) {
    Station user = Station(
      longtitude: model.longtitude,
      latitude: model.latitude,
      radius: model.radius,
    );
    return user;
  }
}
