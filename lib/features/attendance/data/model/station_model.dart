import 'package:orio_attendance_app_flutter/features/attendance/domain/entity/station_entitiy.dart';

class StationModel extends Station {
  const StationModel({
    required String longitude,
    required String latitude,
    required int radius,
  }) : super(
          longtitude: longitude,
          latitude: latitude,
          radius: radius,
        );

  factory StationModel.fromJson(Map<String, dynamic> json) {
    return StationModel(
      longitude: json['longtitude'],
      latitude: json['latitude'],
      radius: json['radius'] as int,
    );
  }
}
