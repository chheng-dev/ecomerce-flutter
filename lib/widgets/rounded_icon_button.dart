import 'package:flutter/material.dart';

class RoundedIconButtonWidget extends StatelessWidget {
  const RoundedIconButtonWidget(
    {
      super.key, 
      required this.icon, 
      required this.onPress, 
      required this.iconSize
    });

  final IconData icon;
  final Function onPress;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      // constraints: BoxConstraints.tightFor(width: iconSize, height: iconSize),
      onPressed: () => onPress,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      fillColor: Color(0xFF65A34A),
      child: Icon(
        icon,
        size: iconSize * 0.8,
        color: Colors.white,
      ),
    );
  }
}