import 'package:flutter/material.dart';
import 'package:orio_attendance_app_flutter/features/notification/presentation/screen/widgets/notification_tile.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/text.dart';
import 'package:orio_attendance_app_flutter/shared/layout/layout.dart';

part 'widgets/body.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  static String id = "notification_screen";

  @override
  Widget build(BuildContext context) {
    return const Layout(
      currentTab: 3,
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}
