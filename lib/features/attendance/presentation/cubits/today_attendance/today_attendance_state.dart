// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'today_attendance_cubit.dart';

enum TodayAttendanceStatus {
  loading,
  loaded,
}

class TodayAttendanceState extends Equatable {
  final TodayAttendanceStatus status;
  final AttendanceData attendanceData;

  const TodayAttendanceState({
    required this.attendanceData,
    required this.status,
  });

  factory TodayAttendanceState.initial() => TodayAttendanceState(
      attendanceData: AttendanceData.initial(),
      status: TodayAttendanceStatus.loaded);

  @override
  List<Object> get props => [attendanceData];

  @override
  bool get stringify => true;

  TodayAttendanceState copyWith({
    AttendanceData? attendanceData,
    TodayAttendanceStatus? status,
  }) {
    return TodayAttendanceState(
      attendanceData: attendanceData ?? this.attendanceData,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'attendanceData': attendanceData.toMap(),
      'status': 'loaded',
    };
  }

  factory TodayAttendanceState.fromMap(Map<String, dynamic> map) {
    return TodayAttendanceState(
      attendanceData:
          AttendanceData.fromMap(map['attendanceData'] as Map<String, dynamic>),
      status: TodayAttendanceStatus.loaded,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodayAttendanceState.fromJson(String source) =>
      TodayAttendanceState.fromMap(json.decode(source) as Map<String, dynamic>);
}
