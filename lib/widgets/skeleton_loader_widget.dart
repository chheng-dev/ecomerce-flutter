import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class SkeletonLoaderWidget extends StatelessWidget {
  const SkeletonLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer(
            enabled: true,
            duration: Duration(seconds: 2),
            interval: Duration(seconds: 5),
            color: AppColors.backgroundColor,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.4,
              height: 180,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 12),
          Shimmer(
            enabled: true,
            duration: Duration(seconds: 2),
            interval: Duration(milliseconds: 500),
            color: AppColors.backgroundColor,
            child: Container(
              width:
                  MediaQuery.of(context).size.width /
                  2.4, // Half width for subtitle
              height: 15,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          SizedBox(height: 12),
          Shimmer(
            enabled: true,
            duration: Duration(seconds: 2),
            interval: Duration(milliseconds: 500),
            color: AppColors.backgroundColor,
            child: Container(
              width:
                  MediaQuery.of(context).size.width /
                  3.4, // Half width for subtitle
              height: 15,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          SizedBox(height: 12),
          Shimmer(
            enabled: true,
            duration: Duration(seconds: 2),
            interval: Duration(milliseconds: 500),
            color: AppColors.backgroundColor,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.4,
              height: 15,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
