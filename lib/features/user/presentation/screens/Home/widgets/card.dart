import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance/attendance_screen.dart';
import 'package:orio_attendance_app_flutter/shared/routes/navigate.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => Navigate.to(context, AttendanceScreen.id),
      child: Container(
        width: size.width * 0.45,
        height: 160,
        decoration: const BoxDecoration(
          color: Color(0xFFEEEFF1),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/attendance.svg'),
            const SizedBox(height: 10),
            const Text('Attendance'),
          ],
        ),
      ),
    );
  }
}
