import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class CardMainCategoryWidget extends StatelessWidget {
  final String title;
  final String image_url;

  const CardMainCategoryWidget({super.key, required this.title, required this.image_url});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: ConfigConstants.margin0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      width: double.infinity,
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ConfigConstants.padding2
            ),
            child: Text(
              "${title}",
              style: TextStyle(
                fontSize: ConfigConstants.fontSize1,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12)
            ),
            child: Image.network(
              "${image_url}",
              fit: BoxFit.cover,
              width: 100,
              height: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}