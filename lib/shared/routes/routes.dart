import 'package:flutter/material.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance/attendance_screen.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance_data/attendance_data_screen.dart';
import 'package:orio_attendance_app_flutter/features/notification/presentation/screen/notification_screen.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Home/home_screen.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Login/login_screen.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Otp/otp_screen.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Splash/splash_screen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    SplashScreen.id: (context) => const SplashScreen(),
    LoginScreen.id: (context) => const LoginScreen(),
    OtpScreen.id: (context) => const OtpScreen(),
    HomeScreen.id: (context) => const HomeScreen(),
    NotificationScreen.id: (context) => const NotificationScreen(),
    AttendanceScreen.id: (context) => const AttendanceScreen(),
    AttendanceDataScreen.id: (context) => const AttendanceDataScreen(),
  };
}
