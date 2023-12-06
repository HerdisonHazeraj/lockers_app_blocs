import 'package:flutter/material.dart';

class CEFFFloatingActionButton extends StatefulWidget {
  const CEFFFloatingActionButton(
    this.icon, {
    super.key,
    this.backgroundColor,
    this.shape = const CircleBorder(),
    this.onPressed,
  });
  final Icon icon;
  final Color? backgroundColor;
  final ShapeBorder shape;

  final VoidCallback? onPressed;
  @override
  State<CEFFFloatingActionButton> createState() =>
      _CEFFFloatingActionButtonState();
}

class _CEFFFloatingActionButtonState extends State<CEFFFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: widget.onPressed,
      backgroundColor: widget.backgroundColor ?? const Color(0xfffb3274),
      shape: widget.shape,
      child: widget.icon,
    );
  }
}
