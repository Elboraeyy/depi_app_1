import 'package:flutter/material.dart';

class CustomAppField extends StatelessWidget {
  const CustomAppField({
    super.key,
    required this.hint,
    this.suffixIcon,
    this.isobscure = false,
    this.controller,
    this.onChanged,
  });

  final String hint;
  final Widget? suffixIcon;
  final bool isobscure;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: isobscure,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.grey.shade300,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.orange),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xffF3F3F3)),
        ),
      ),
    );
  }
}
