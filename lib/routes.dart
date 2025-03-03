import 'package:ecomerce_app/views/bag_screen.dart';
import 'package:ecomerce_app/views/favorites_screen.dart';
import 'package:ecomerce_app/views/forgot_password_screen.dart';
import 'package:ecomerce_app/views/main_screen.dart';
import 'package:ecomerce_app/views/login_screen.dart';
import 'package:ecomerce_app/views/shop_screen.dart';
import 'package:ecomerce_app/views/user_profile_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  "/home": (context) => LoginScreen(),
  "/forgot-password": (context) => ForgotPasswordWidget(),
  "/": (context) => MainScreen(),
  "/shop": (context) => ShopScreen(),
  "/bag": (context) => BagScreen(),
  "/favorites": (context) => FavoritesScreen(),
  "/user-profile": (context) => UserProfileScreen()
};

