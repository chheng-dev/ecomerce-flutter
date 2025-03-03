import 'package:ecomerce_app/widgets/home_screen/banner_widget.dart';
import 'package:ecomerce_app/widgets/home_screen/new_section_widget.dart';
import 'package:ecomerce_app/widgets/home_screen/sale_section_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Container(
          child: Column(
            children: [
              BannerWidget(),
              SaleSectionWidget(),
              NewSectionWidget(),
            ],
          ),
        )
      ],
    );
  }
}
