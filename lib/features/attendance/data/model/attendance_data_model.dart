import 'package:orio_attendance_app_flutter/features/attendance/domain/entity/attendance_data_entity.dart';

class AttendanceDataModel extends AttendanceData {
  const AttendanceDataModel({
    required String date,
    required String day,
    required String type,
    required String? checkIn,
    required String? checkOut,
    required String? workingHours,
  }) : super(
          date: date,
          day: day,
          type: type,
          checkIn: checkIn,
          checkOut: checkOut,
          workingHours: workingHours,
        );

  factory AttendanceDataModel.fromJson(Map<String, dynamic> json) {
    return AttendanceDataModel(
      date: json['attendance_date'],
      day: json['day'],
      checkIn: json['intime'],
      checkOut: json['outtime'],
      workingHours: json['working_hours'],
      type: json['type'],
    );
  }
}
