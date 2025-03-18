import 'package:ecomerce_app/widgets/size_item_widget.dart';
import 'package:flutter/material.dart';

class SizeContainerWidget extends StatefulWidget {
  final List<String> sizes;  
  const SizeContainerWidget({
    super.key, required this.sizes, 
  });

  @override
  State<SizeContainerWidget> createState() => _SizeContainerWidgetState();
}

class _SizeContainerWidgetState extends State<SizeContainerWidget> {
  String selectedSize = "";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.sizes.map((size) {
        return Container(
          child: SizeItemWidget(
            size: size,
            isActive: selectedSize == size,
            onTab: () {
              setState(() {
                selectedSize = size;
              });
            },
          )
        );
      }).toList()
    );
  }
}