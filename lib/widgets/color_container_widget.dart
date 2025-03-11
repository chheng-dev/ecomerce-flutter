import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class ColorContainerWidget extends StatefulWidget {
  final List<Map<String, String>> colors;

  const ColorContainerWidget({super.key, required this.colors});

  @override
  _ColorContainerWidgetState createState() => _ColorContainerWidgetState();
}

class _ColorContainerWidgetState extends State<ColorContainerWidget> {
  String selectedColor = "";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, 
        itemCount: widget.colors.length,
        itemBuilder: (context, index) {
          final item = widget.colors[index];
          final bool isActive =
              selectedColor == item["code"]; 

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedColor = item["code"]!;
              });
            },
            child: _buildColorItemSection(context, item, isActive),
          );
        },
      ),
    );
  }
}

Widget _buildColorItemSection(
  BuildContext context,
  Map<String, String> item,
  bool isActive,
) {
  return Container(
    padding: EdgeInsets.all(ConfigConstants.padding0),
    margin: EdgeInsets.only(right: ConfigConstants.margin0),
    decoration: BoxDecoration(
      color: isActive ? AppColors.primaryColor : AppColors.lightColor,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        width: 1,
        color: isActive ? AppColors.primaryColor : AppColors.greyColor,
      )
    ),
    child: Center(
      child: Text(
        item["name"]!,
        style: TextStyle(
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? Colors.white : Colors.black,
        ),
      ),
    ),
  );
}
