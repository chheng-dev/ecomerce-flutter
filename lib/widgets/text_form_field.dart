import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final VoidCallback? onPressIconButton;
  // final String? Function(String?)? validator;

  TextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.onPressIconButton
  });

  @override
  Widget build(BuildContext context) {
  return Container(
    color: Colors.white,
    child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        hintText: hintText,
        suffixIcon: GestureDetector(
          onTap: onPressIconButton,
          child: suffixIcon,
        ),
      ),
    ),
  );  
  }
}