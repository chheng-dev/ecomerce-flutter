import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropdownButtonWidget extends StatefulWidget {
  final List<String> items;
  final String labelText;

  const DropdownButtonWidget({super.key, required this.items, required this.labelText});

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  final dropDownKey = GlobalKey<DropdownSearchState>();
  String? selectedItem;

  @override
  void initState() {
    super.initState();
    if(widget.items.isEmpty){
      selectedItem = widget.items.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownSearch<String>(
        key: dropDownKey,
        selectedItem: selectedItem,
        items:
            (filter, infiniteScrollProps) => widget.items,
        onChanged: (value) {
          setState(() {
            selectedItem = value; 
          });
        },
        decoratorProps: DropDownDecoratorProps(
          decoration: InputDecoration(
            labelText: widget.labelText,
            border: OutlineInputBorder(),
          ),
        ),
        popupProps: PopupProps.menu(
          fit: FlexFit.loose, 
          constraints: BoxConstraints()
        ),
      ),
    );
  }
}