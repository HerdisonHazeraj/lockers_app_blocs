import 'package:flutter/material.dart';

class CEFFDropdownField extends StatelessWidget {
  const CEFFDropdownField(
    this.label,
    this.items, {
    this.choosedItem,
    this.icon,
    this.iconSize = 24,
    this.onChanged,
    this.enabled = true,
    this.border,
    super.key,
  });
  final String label;
  final String? choosedItem;
  final Map<String, String> items;
  final IconData? icon;
  final int iconSize;
  final Function(String?)? onChanged;
  final bool enabled;
  final InputBorder? border;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: items.entries
          .map(
            (e) => DropdownMenuItem(
              value: e.key,
              child: Text(e.value),
            ),
          )
          .toList(),
      decoration: InputDecoration(
        border: border,
        prefixIcon: icon != null
            ? Icon(
                icon,
                size: iconSize.toDouble(),
              )
            : null,
      ),
      value: choosedItem,
      hint: Text(
        label,
        style: const TextStyle(color: Colors.black),
      ),
      iconSize: 36,
      icon: const Icon(
        Icons.arrow_drop_down_outlined,
        color: Colors.black54,
      ),
      onChanged: enabled ? (value) => onChanged : null,
    );
  }
}
