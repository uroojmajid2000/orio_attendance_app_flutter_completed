import 'package:orio_attendance_app_flutter/features/attendance/data/model/attendance_data_model.dart';
import 'package:orio_attendance_app_flutter/features/attendance/domain/entity/attendance_data_entity.dart';
import 'package:orio_attendance_app_flutter/shared/mapper/mapper.dart';

class AttendanceDataMapper extends Mapper<AttendanceData, AttendanceDataModel> {
  @override
  AttendanceData mapModeltoEntity(AttendanceDataModel model) {
    AttendanceData user = AttendanceData(
      date: model.date,
      day: model.day,
      type: model.type,
      checkIn: model.checkIn,
      checkOut: model.checkOut,
      workingHours: model.workingHours,
    );
    return user;
  }
}
