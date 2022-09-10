import 'package:flutter/material.dart';

// Colors
const kPrimaryColor = MaterialColor(
  0xFFEE2A54, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
  <int, Color>{
    50: Color(0xFFEE2A54), //10%
    100: Color(0xFFEE2A54), //20%
    200: Color(0xFFEE2A54), //30%
    300: Color(0xFFEE2A54), //40%
    400: Color(0xFFEE2A54), //50%
    500: Color(0xFFEE2A54), //60%
    600: Color(0xFFEE2A54), //70%
    700: Color(0xFFEE2A54), //80%
    800: Color(0xFFEE2A54), //90%
    900: Color(0xFFEE2A54), //100%
  },
);
const kGray100 = Color(0xFFF4F6F9);
const kGray200 = Color(0xFFEEEFF1);
const kGray500 = Color(0xFF9E9E9E);
const kDisabledColor = Color(0xFF232323);
const kTextFieldColor = Color(0xFFF3F2F2);
const kBackgroundColor = Color(0xFF2F2F7E);

// Gradient
const kGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment(0.8, 1),
  colors: <Color>[
    Color(0xFFEE2A54),
    Color(0xFFFC5C7D),
  ],
  tileMode: TileMode.mirror,
);

const kGradient2 = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment(0.8, 1),
  colors: <Color>[
    Color(0xFF2F2F7E),
    Color(0xFF6A82FB),
  ],
  tileMode: TileMode.mirror,
);
