import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class SizeItemWidget extends StatelessWidget {
  final String size;
  final bool isActive;
  final VoidCallback onTab;

  const SizeItemWidget({super.key, required this.size, required this.isActive, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: 48,
        padding: EdgeInsets.all(ConfigConstants.padding0),
        margin: EdgeInsets.only(right: ConfigConstants.margin0),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryColor 
                 : AppColors.lightColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: isActive ? AppColors.primaryColor
                            : AppColors.greyColor
          )
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              color: isActive ? AppColors.lightColor : AppColors.blackColor
            ),
          ),
        ),
      ),
    );
  }
}