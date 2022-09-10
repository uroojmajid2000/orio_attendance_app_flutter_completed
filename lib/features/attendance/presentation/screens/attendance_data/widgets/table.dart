import 'package:flutter/material.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/cubits/attendance_data/attendance_data_cubit.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance_data/widgets/build_table_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orio_attendance_app_flutter/resources/colors.dart';

class MyTable extends StatefulWidget {
  const MyTable({Key? key}) : super(key: key);

  @override
  State<MyTable> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  @override
  Widget build(BuildContext context) {
    return context.watch<AttendanceDataCubit>().state.status ==
            AttendanceDataStatus.loading
        ? const CircularProgressIndicator(
            color: kPrimaryColor,
          )
        : Table(
            border: TableBorder.all(
              color: const Color(0xFFC4C4C4),
              width: 1,
            ),
            children: [
              TableRow(
                decoration: const BoxDecoration(
                  color: Color(0xFFF7F7F7),
                ),
                children: [
                  buildHeaderCell('Date'),
                  buildHeaderCell('Check In'),
                  buildHeaderCell('Check Out'),
                  buildHeaderCell('Work Hr\'s'),
                ],
              ),
              for (var data
                  in context.watch<AttendanceDataCubit>().state.attendanceData)
                if (data.type == 'Holiday' || data.type == 'Absent')
                  buildTableRow(
                    date: data.date,
                    day: data.day,
                    checkin: '-',
                    checkout: '-',
                    hours: '-',
                    type: data.type,
                  )
                else
                  buildTableRow(
                    date: data.date,
                    day: data.day,
                    checkin: data.checkIn,
                    checkout: data.checkOut,
                    hours: data.workingHours,
                    type: data.type,
                  ),
            ],
          );
  }

  Padding buildHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
