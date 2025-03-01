import 'package:ecomerce_app/views/forgot_password_screen.dart';
import 'package:ecomerce_app/views/home_screen.dart';
import 'package:ecomerce_app/views/login_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  "/": (context) => LoginScreen(),
  "/forgot-password": (context) => ForgotPasswordWidget(),
  "/home": (context) => HomeScreen(),
};

