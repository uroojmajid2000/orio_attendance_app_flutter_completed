import 'package:flutter/material.dart';

class OtpAppBar extends StatelessWidget with PreferredSizeWidget {
  const OtpAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_outlined,
          color: Color(0xFF404040),
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'OTP',
        style: TextStyle(color: Color(0xFF404040)),
      ),
    );
  }
}
