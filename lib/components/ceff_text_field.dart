import 'package:flutter/material.dart';

class CEFFTextField extends StatelessWidget {
  const CEFFTextField(
    this.label,
    this.icon, {
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.errorMsg,
    this.border,
    super.key,
  });

  final String label;
  final Icon icon;
  final String? Function(String?)? onChanged;
  final bool enabled;
  final bool readOnly;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? errorMsg;
  final TextInputType? keyboardType;
  final InputBorder? border;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      keyboardType: keyboardType,
      readOnly: readOnly,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
        border: border,
        prefixIcon: icon,
        errorText: errorMsg,
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
