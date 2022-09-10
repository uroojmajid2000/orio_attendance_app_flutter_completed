import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Otp/widgets/app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/cubits/station/station_cubit.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/cubit/user_cubit.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Home/home_screen.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Otp/widgets/text_field_box.dart';
import 'package:orio_attendance_app_flutter/shared/routes/navigate.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/alert.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/button.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/text.dart';
import 'package:alt_sms_autofill/alt_sms_autofill.dart';

part 'widgets/body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  static String id = "otp_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OtpAppBar(),
      body: Body(),
    );
  }
}
