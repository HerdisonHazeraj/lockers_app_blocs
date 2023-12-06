import 'package:flutter/material.dart';

class CEFFTitleMenuText extends StatelessWidget {
  const CEFFTitleMenuText(
    this.title, {
    this.fontSize = 18,
    this.height = 1.3,
    super.key,
  });

  final String title;
  final double fontSize;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.black54,
        fontWeight: FontWeight.w500,
        height: height,
      ),
    );
  }
}
