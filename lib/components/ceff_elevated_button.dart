import 'package:flutter/material.dart';

class CEFFElevatedButton extends StatelessWidget {
  const CEFFElevatedButton(
    this.text, {
    this.onPressed,
    this.icon,
    this.fontSize = 14,
    this.borderRadius = 6,
    super.key,
  });

  final String text;
  final IconData? icon;
  final double fontSize;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black54),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: icon != null
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          icon != null ? Icon(icon) : const Text(""),
          Text(
            text,
            style: TextStyle(fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}
