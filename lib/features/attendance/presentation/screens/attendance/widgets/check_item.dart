import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckItem extends StatelessWidget {
  final String time, text, icon;

  const CheckItem(
      {super.key, required this.time, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: Column(
        children: [
          SvgPicture.asset(icon),
          const SizedBox(height: 5),
          Text(
            time,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Text(
            text,
            style: const TextStyle(color: Color(0xFF6E6E6E), fontSize: 10),
          ),
        ],
      ),
    );
  }
}
