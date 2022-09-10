// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'attendance_data_cubit.dart';

enum AttendanceDataStatus {
  initial,
  loading,
  loaded,
  error,
}

class AttendanceDataState extends Equatable {
  final List<AttendanceData> attendanceData;
  final AttendanceDataStatus status;

  const AttendanceDataState(
      {required this.attendanceData, required this.status});

  factory AttendanceDataState.initial() => const AttendanceDataState(
      attendanceData: [], status: AttendanceDataStatus.initial);

  @override
  List<Object> get props => [attendanceData, status];

  @override
  bool get stringify => true;

  AttendanceDataState copyWith({
    List<AttendanceData>? attendanceData,
    AttendanceDataStatus? status,
  }) {
    return AttendanceDataState(
      attendanceData: attendanceData ?? this.attendanceData,
      status: status ?? this.status,
    );
  }
}
