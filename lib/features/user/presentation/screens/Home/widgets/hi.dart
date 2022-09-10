import 'package:flutter/material.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/cubit/user_cubit.dart';
import 'package:orio_attendance_app_flutter/resources/colors.dart';
import 'package:orio_attendance_app_flutter/resources/constants.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Hi extends StatefulWidget {
  const Hi({Key? key}) : super(key: key);

  @override
  State<Hi> createState() => _HiState();
}

class _HiState extends State<Hi> {
  String greeting = 'Good Morning';

  @override
  void initState() {
    super.initState();
    _setGreeting();
  }

  _setGreeting() async {
    final now = DateTime.now();
    final hour = now.hour;
    if (hour < 12) {
      setState(() {
        greeting = 'Good Morning';
      });
    } else if (hour < 18) {
      setState(() {
        greeting = 'Good Afternoon';
      });
    } else if (hour < 21) {
      setState(() {
        greeting = 'Good Evening';
      });
    } else {
      setState(() {
        greeting = 'Good Night';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kDefaultPadding,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: kPrimaryColor,
            child: Icon(
              Icons.account_circle,
              size: 40,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.h2('Hi, ${context.read<UserCubit>().state.user.name}'),
              const SizedBox(height: 5),
              MyText.body(greeting),
            ],
          ),
        ],
      ),
    );
  }
}
