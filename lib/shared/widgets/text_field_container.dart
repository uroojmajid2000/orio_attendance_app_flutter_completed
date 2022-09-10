import 'package:flutter/cupertino.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final double width;

  const TextFieldContainer({super.key, required this.child, this.width = 0.0});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: width == 0.0 ? size.width * 0.8 : width,
      child: child,
    );
  }
}
