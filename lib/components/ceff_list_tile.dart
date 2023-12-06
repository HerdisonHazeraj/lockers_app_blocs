import 'package:flutter/material.dart';

class CEFFListTile extends StatefulWidget {
  const CEFFListTile(
    this.title, {
    this.onTap,
    this.titleColor = Colors.black,
    this.subTitle = "",
    this.icon,
    this.iconSize = 36,
    this.iconColor = Colors.black,
    this.trailing,
    this.borderRadius = 0,
    super.key,
  });

  final VoidCallback? onTap;
  final String title;
  final Color titleColor;
  final String subTitle;
  final IconData? icon;
  final double iconSize;
  final Color iconColor;
  final Widget? trailing;
  final double borderRadius;

  @override
  State<CEFFListTile> createState() => _CEFFListTileState();
}

class _CEFFListTileState extends State<CEFFListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      title: Text(
        widget.title,
        style: TextStyle(fontSize: 18, color: widget.titleColor),
      ),
      subtitle: widget.subTitle != "" ? Text(widget.subTitle.toString()) : null,
      leading: widget.icon != null
          ? Icon(
              widget.icon,
              size: widget.iconSize,
              color: widget.iconColor,
            )
          : null,
      trailing: widget.trailing,
      onTap: widget.onTap,
    );
  }
}
