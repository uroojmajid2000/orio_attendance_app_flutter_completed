import 'package:equatable/equatable.dart';

class AttendanceData extends Equatable {
  final String date, day, type;
  final String? checkIn, checkOut, workingHours;

  const AttendanceData({
    required this.date,
    required this.day,
    required this.checkIn,
    required this.checkOut,
    required this.workingHours,
    required this.type,
  });

  factory AttendanceData.initial() => const AttendanceData(
        date: '',
        day: '',
        checkIn: null,
        checkOut: null,
        workingHours: null,
        type: '',
      );

  @override
  List<Object?> get props => [date, day, checkIn, checkOut, workingHours, type];

  @override
  bool get stringify => true;

  factory AttendanceData.fromJson(Map<String, dynamic> json) {
    return AttendanceData(
      date: json['attendance_date'],
      day: json['day'],
      checkIn: json['intime'],
      checkOut: json['outtime'],
      workingHours: json['working_hours'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'attendance_date': date,
      'day': day,
      'intime': checkIn,
      'outtime': checkOut,
      'working_hours': workingHours,
      'type': type,
    };
  }

  factory AttendanceData.fromMap(Map<String, dynamic> map) {
    return AttendanceData(
      date: map['attendance_date'],
      day: map['day'],
      checkIn: map['intime'],
      checkOut: map['outtime'],
      workingHours: map['working_hours'],
      type: map['type'],
    );
  }
}
