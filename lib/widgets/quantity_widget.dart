import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          "Size",
          style: TextStyle(
            fontSize: ConfigConstants.fontSize1
          ),
        ),
      ),
    );
  }
}