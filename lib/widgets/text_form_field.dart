import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;

  TextFieldWidget({
    super.key, 
    required this.hintText,
    required this.controller, 
    required this.keyboardType,
    this.obscureText = false,
    this.validator
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  void dispose(){
   widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}