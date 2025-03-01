import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:ecomerce_app/routes.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Comerce App',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        textTheme: TextTheme(
          headlineMedium: AppTextStyles.headerStyle
        ),
      ),
      initialRoute: "/",
      routes: routes,
    );
  }
}