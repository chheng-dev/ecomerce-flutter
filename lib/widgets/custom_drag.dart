import 'package:flutter/material.dart';

class CustomDrag extends StatelessWidget {
  const CustomDrag({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: 50,
          height: 5.0,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(10)
          ),
        ),
      ],
    );
  }
}