import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String btn_title;
  final Function onSubmit;

  const ButtonWidget({
    super.key, 
    required this.btn_title, 
    required this.onSubmit
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
        ),
        onPressed: () => onSubmit,
        child: Text(
          "${btn_title}", 
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}