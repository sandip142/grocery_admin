import 'package:flutter/material.dart';
import 'package:grocery_admin/consts/constants.dart';
import 'package:grocery_admin/responsive.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.backgroudcolor,
    required this.onPressed,
    required this.icon,
    required this.text,
  });
  final VoidCallback onPressed;
  final String text;
  final Color backgroudcolor;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroudcolor,
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding * 1.5,
          vertical: defaultPadding / (Responsive.isDesktop(context) ? 1 : 2),
        ),
      ),
      icon: Icon(
        icon,
        size: 20,
      ),
      label: Text(text),
    );
  }
}
