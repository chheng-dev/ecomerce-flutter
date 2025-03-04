import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class WomenTabWidget extends StatelessWidget {
  const WomenTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ConfigConstants.padding2,
        vertical: ConfigConstants.padding2
      ),
      child: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12)
            ),
            child: ListTile(
              title: Text(
                "SUMMER SLAES",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: ConfigConstants.fontSize3,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(
                "Up to 50% off",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: ConfigConstants.fontSize2,
                  color: Colors.white
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}