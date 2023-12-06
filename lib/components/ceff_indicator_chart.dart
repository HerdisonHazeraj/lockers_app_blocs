import 'package:flutter/material.dart';

class CEFFIndicatorChart extends StatelessWidget {
  const CEFFIndicatorChart(
    this.text,
    this.color, {
    this.size = 20,
    this.space = 4,
    super.key,
  });
  final Color color;
  final String text;
  final int size;
  final int space;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size.toDouble(),
          height: size.toDouble(),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: color,
          ),
        ),
        SizedBox(
          width: space.toDouble(),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        )
      ],
    );
  }
}
