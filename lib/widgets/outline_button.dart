import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const OutlineButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        elevation: 0,
        backgroundColor: AppColors.lightColor,
      ),
      onPressed: (){
        onPressed();
      },
      child: Text(
        title, style: 
        TextStyle(
          color: AppColors.blackColor, 
          fontWeight: FontWeight.w600
        )
      ),
    );
  }
}