import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/cubit/user_cubit.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Home/home_screen.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Login/login_screen.dart';
import 'package:orio_attendance_app_flutter/resources/colors.dart';
import 'package:orio_attendance_app_flutter/shared/routes/navigate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String id = "splash_screen";

  @override
  Widget build(BuildContext context) {
    void _onSuccess() {
      if (context.read<UserCubit>().isLoggedIn()) {
        Navigate.next(context, HomeScreen.id);
      } else {
        Navigate.next(context, LoginScreen.id);
      }
    }

    void _navigateToNextScreen(VoidCallback onSuccess) async {
      await Future.delayed(const Duration(seconds: 2));
      onSuccess.call();
    }

    useEffect(() {
      _navigateToNextScreen(_onSuccess);
      return null;
    }, []);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: SvgPicture.asset('assets/logos/orio.svg'),
      ),
    );
  }
}
