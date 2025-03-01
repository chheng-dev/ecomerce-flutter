import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:ecomerce_app/models/User.dart';
import 'package:flutter/material.dart';

class LoginController {
  final UserModel _model = UserModel();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context){
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (_model.validateCredentails(email, password)){
      Navigator.pushReplacementNamed(context, '/home');
    } else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.primaryColor,
          duration: Duration(seconds: 3),
          content: Row(
            children: [
              Icon(Icons.error_outline, color: Colors.white),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Invalid email or password. Please try again.",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.all(16),
        ),
      );
    }
  }
}
