import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:ecomerce_app/models/Product.dart';
import 'package:ecomerce_app/widgets/avalible_stock_widget.dart';
import 'package:ecomerce_app/widgets/color_container_widget.dart';
import 'package:ecomerce_app/widgets/size_container_widget.dart';
import 'package:flutter/material.dart';

class OptionTypeWidget extends StatelessWidget {
  final Product product;

  const OptionTypeWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ConfigConstants.padding2,
        vertical: ConfigConstants.padding0
      ),
      child: _buildOptionSize(context, product),
    );
  }
}

Widget _buildOptionSize(BuildContext context, Product product) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Option: Size",
        style: TextStyle(fontSize: ConfigConstants.fontSize1),
      ),
      IconButton(
        onPressed: () {
          _onShowModalBottomSheet(context, product);
        },
        icon: Icon(Icons.arrow_forward_ios_rounded, size: 16),
      ),
    ],
  );
}

void _onShowModalBottomSheet(BuildContext context, Product product){
  showModalBottomSheet(
    enableDrag: true,
    backgroundColor: AppColors.backgroundColor,
    showDragHandle: true,
    context: context, 
    builder: (BuildContext context) {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImagePrice(context, product),
                SizedBox(height: ConfigConstants.sizebox2),
                Divider(),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      _buildSizeSeciton(),
                      SizedBox(height: ConfigConstants.sizebox2),
                      Divider(),
                      _buildColorSection(context)
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              left: ConfigConstants.padding1,
              right: ConfigConstants.padding1,
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        elevation: 0,
                        backgroundColor: AppColors.lightColor,
                      ),
                      onPressed: () => {},
                      child: Text(
                        "Add to Cart", style: 
                        TextStyle(
                          color: AppColors.blackColor, 
                          fontWeight: FontWeight.w600
                        )
                      ),
                    ),
                  ),
                  SizedBox(width: ConfigConstants.sizebox2),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        elevation: 0,
                        backgroundColor: AppColors.primaryColor,
                      ),
                      onPressed: () => {},
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
  );
}

Widget _buildColorSection(BuildContext context) {
  final List<Map<String, String>> colors = [
      {"name": "Red", "code": "#FF0000"},
      {"name": "Blue", "code": "#0000FF"},
      {"name": "Green", "code": "#00FF00"},
      {"name": "Yellow", "code": "#FFFF00"},
      {"name": "Purple", "code": "#800080"},
  ];

  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: ConfigConstants.padding1,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text(
          "Colors",
          style: TextStyle(fontSize: ConfigConstants.fontSize1),
        ),
        SizedBox(height: 8.0),
        ColorContainerWidget(colors: colors),
      ],
    ),
  );
}

Widget _buildSizeSeciton() {
  final List<String> sizes = ["XS", "S", "M", "L", "XL"];

  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: ConfigConstants.padding1,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Size",
          style: TextStyle(
            fontSize: ConfigConstants.fontSize1
          ),
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            SizeContainerWidget(sizes: sizes),
          ],
        ),
      ],
    ),
  );
}

Widget _buildImagePrice(BuildContext context, Product product) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: ConfigConstants.padding1),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.greyColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.network(product.thumbnail, width: 96),
        ),
        SizedBox(width: 12.0),
        Expanded(
          child: ListTile(
            title: Text(
              "\$${product.price}",
              style: TextStyle(
                fontSize: ConfigConstants.fontSize2,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: AvalibleStockWidget(product: product),
          ),
        ),
        IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          }, 
          icon: Icon(Icons.close)
        )
      ],
    ),
  );
}

