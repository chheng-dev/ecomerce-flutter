import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:ecomerce_app/models/Product.dart';
import 'package:flutter/material.dart';

class AvalibleStockWidget extends StatelessWidget {
  final Product product;
  const AvalibleStockWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return _checkStockAvailability();
  }

  Widget _checkStockAvailability() {
    if (product.stock != 0) {
      return Text(
        "In Stock",
        style: TextStyle(
          color: AppColors.successColor,
          fontWeight: FontWeight.bold
        ),
      );
    } else {
      return Text(
        "Out of Stock",
        style: TextStyle(
          color: Colors.red
        ),
      );
    }
  }
}


