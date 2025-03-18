import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:flutter/material.dart';


class ListStatusProfileWidget extends StatelessWidget {
  const ListStatusProfileWidget({super.key, required this.title, required this.description, required this.onPress});

  final String title;
  final String description;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                "${title}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ConfigConstants.fontSize1,
                ),
              ),
              subtitle: Text("${description}"),
            ),
          ),
          IconButton(
            onPressed: () => onPress,
            icon: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ],
      ),
    );
  }
}
