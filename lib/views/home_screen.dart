import 'package:ecomerce_app/widgets/home_screen/banner_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BannerWidget()
      ],
    );
  }
}
