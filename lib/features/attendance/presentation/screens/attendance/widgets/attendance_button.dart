import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/cubits/today_attendance/today_attendance_cubit.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/cubit/user_cubit.dart';
import 'package:orio_attendance_app_flutter/resources/colors.dart';
import "package:flutter_bloc/flutter_bloc.dart";

class AttendanceButton extends StatefulWidget {
  final bool isInRange;

  const AttendanceButton({super.key, required this.isInRange});

  @override
  State<AttendanceButton> createState() => _AttendanceButtonState();
}

class _AttendanceButtonState extends State<AttendanceButton> {
  @override
  Widget build(BuildContext context) {
    void fetchAttendance(String token) async {
      await context.read<TodayAttendanceCubit>().get(token);
    }

    return GestureDetector(
      onTap: (() {
        if (widget.isInRange) {
          String token = context.read<UserCubit>().state.user.token;
          fetchAttendance(token);
        }
      }),
      child: Container(
        width: 172,
        height: 172,
        decoration: BoxDecoration(
          color: widget.isInRange ? null : kGray500,
          gradient: widget.isInRange
              ? (context
                          .watch<TodayAttendanceCubit>()
                          .state
                          .attendanceData
                          .checkIn ==
                      null
                  ? kGradient
                  : kGradient2)
              : null,
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            context.watch<TodayAttendanceCubit>().state.status ==
                    TodayAttendanceStatus.loaded
                ? SvgPicture.asset('assets/icons/attendance_click.svg')
                : const CircularProgressIndicator(color: Colors.white),
            const SizedBox(height: 10),
            Text(
              context
                          .watch<TodayAttendanceCubit>()
                          .state
                          .attendanceData
                          .checkIn ==
                      null
                  ? 'Check In'
                  : 'Check Out',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
