import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.suffixIcon,
      this.obscureText = false,
      this.validator,this.onChanged,this.errorText});

  final TextEditingController controller;
  final String labelText;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? errorText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged:onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        errorText: errorText,
        suffixIcon: suffixIcon,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0), // Circular border
        ),
      ),
    );
  }
}
