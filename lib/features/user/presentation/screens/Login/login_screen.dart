import 'package:flutter/material.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/cubit/user_cubit.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Login/widgets/transparent_text_field.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Otp/otp_screen.dart';
import 'package:orio_attendance_app_flutter/shared/routes/navigate.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/alert.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/button.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/text_field_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String id = "login_screen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
