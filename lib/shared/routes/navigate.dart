import 'package:flutter/material.dart';

class Navigate {
  static void to(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  static void next(BuildContext context, String route) {
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }
}
