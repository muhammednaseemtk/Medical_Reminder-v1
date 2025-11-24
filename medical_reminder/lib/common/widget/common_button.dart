import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color textColor;
  final Color bgColor;
  const CommonButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.textColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        minimumSize: Size(300, 40)
      ),
      child: Text(text, style: TextStyle(color: textColor,fontWeight: FontWeight.w500,fontSize: 16)),
    );
  }
}
