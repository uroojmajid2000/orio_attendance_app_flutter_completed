import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          color: const Color(0xFFD9D9D9).withOpacity(0.3)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'New Notification Alert!',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum',
            style: TextStyle(color: Color(0xFFA9A9A9)),
          ),
          SizedBox(height: 10),
          Text(
            '10 mins ago',
            style: TextStyle(
              color: Color(0xFFA9A9A9),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
