import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:orio_attendance_app_flutter/resources/constants.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/text.dart';

class DateTimeShow extends HookWidget {
  const DateTimeShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    Timer? timer;

    final dateNow = useState(DateFormat('hh:mm').format(DateTime.now()));

    void updateTime() {
      dateNow.value = DateFormat('hh:mm').format(DateTime.now());
    }

    useEffect(() {
      timer = Timer.periodic(
          const Duration(seconds: 15), (Timer t) => updateTime());
      return () => timer?.cancel();
    }, []);

    return Column(
      children: [
        MyText.h2(dateNow.value),
        MyText.body(
          '${kWeekDays[date.weekday - 1]}, ${kMonthNames[date.month - 1]} ${date.day}',
        ),
      ],
    );
  }
}
