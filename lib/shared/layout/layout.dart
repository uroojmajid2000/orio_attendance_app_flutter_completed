import 'package:flutter/material.dart';
import 'package:orio_attendance_app_flutter/shared/layout/widgets/app_bar.dart';
import 'package:orio_attendance_app_flutter/shared/layout/widgets/layout_bottom_bar.dart';
import 'package:orio_attendance_app_flutter/shared/layout/widgets/layout_fab.dart';

class Layout extends StatelessWidget {
  final Widget body;
  final int currentTab;

  const Layout({super.key, required this.body, this.currentTab = 0});

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;

    return Scaffold(
      appBar: const BuildAppBar(),
      body: body,
      floatingActionButton: keyboardIsOpened ? null : const LayoutFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: LayoutBottomBar(
        currentTab: currentTab,
      ),
    );
  }
}
