import 'package:flutter/material.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/text.dart';

class Alert extends StatelessWidget {
  final String heading, body;

  const Alert({super.key, required this.heading, required this.body});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close,
                size: 60,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MyText.h2(heading),
            const SizedBox(
              height: 5,
            ),
            MyText.body(body),
          ],
        ),
      ),
    );
  }
}
