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
        Expanded( 
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
            title: Text(
              '$title',  
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