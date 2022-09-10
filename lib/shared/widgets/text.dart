import 'package:flutter/material.dart';

class MyText {
  static Widget h1(String text) => Text(
        text,
        style: const TextStyle(
          fontSize: 38.0,
          fontWeight: FontWeight.w700,
        ),
      );

  static Widget h2(String text) => Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 25.0,
        ),
      );

  static Widget body(String text) => Text(
        text,
        style: const TextStyle(
          color: Color(0xFF6E6E6E),
        ),
      );
}
