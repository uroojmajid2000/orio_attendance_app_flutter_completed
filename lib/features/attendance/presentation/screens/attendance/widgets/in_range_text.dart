import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orio_attendance_app_flutter/resources/colors.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/text.dart';

class InRangeText extends StatelessWidget {
  final bool isInRange;

  const InRangeText({super.key, required this.isInRange});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/icons/map_pin.svg',
            color: isInRange ? kPrimaryColor : Colors.grey),
        const SizedBox(width: 5),
        MyText.body(isInRange
            ? 'You are in the office range'
            : 'You are not in the office range'),
      ],
    );
  }
}
