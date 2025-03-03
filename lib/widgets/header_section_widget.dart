import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class HeaderSectionWidget extends StatelessWidget {
  final String title;
  final String sub_title;
  
  const HeaderSectionWidget({
    super.key, required this.title, required this.sub_title});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded( // Wrap ListTile with Expanded to avoid overflow issues
          child: ListTile(
            title: Text(
              '$title',  // Correct string interpolation
              style: TextStyle(
                fontSize: ConfigConstants.fontSize3,
                fontWeight: FontWeight.bold,
              ),
            ), 
            subtitle: Text(
              "${sub_title}",
              style: TextStyle(
                color: Colors.grey
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: (){}, 
          child: Text(
            "View all",
            style: TextStyle(
              color: Colors.black54
            ),
          )
        )
      ],
    );
  }
}