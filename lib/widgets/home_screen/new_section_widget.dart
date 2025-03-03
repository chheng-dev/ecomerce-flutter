import 'package:ecomerce_app/widgets/header_section_widget.dart';
import 'package:flutter/material.dart';

class NewSectionWidget extends StatelessWidget {
  const NewSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSectionWidget(
            title: "New", 
            sub_title: "You're never seen it before!"
          )
        ],
      ),
    );
  }
}