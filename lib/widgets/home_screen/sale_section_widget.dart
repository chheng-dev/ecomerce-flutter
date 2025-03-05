import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:ecomerce_app/controllers/product_controller.dart';
import 'package:ecomerce_app/models/Product.dart';
import 'package:ecomerce_app/widgets/cart_item_widget.dart';
import 'package:ecomerce_app/widgets/header_section_widget.dart';
import 'package:ecomerce_app/widgets/skeleton_loader_widget.dart';
import 'package:flutter/material.dart';

class SaleSectionWidget extends StatefulWidget {
  SaleSectionWidget({super.key});

  @override
  State<SaleSectionWidget> createState() => _SaleSectionWidgetState();
}

class _SaleSectionWidgetState extends State<SaleSectionWidget> {
  final ProductController _productController = ProductController();
  late Future<List<Product>> _productFuture;

  @override
  void initState() {
    super.initState();
    _productFuture = _productController.getProducts();
  }

  Future<void> _refreshData() async {
    await _productController.clearCacheProductLists(() {
      setState(() {
        _productFuture = _productController.getProducts(); // Trigger the update
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0), // Added padding for better UI spacing
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
        children: [
          HeaderSectionWidget(
            title: "Sale",
            sub_title: "Super summer sale",
          ),
          SizedBox(height: ConfigConstants.sizebox1),
          Container(
            width: double.infinity,
            height: 300,
            child: FutureBuilder<List<Product>>(
              future: _productFuture, 
              builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return RefreshIndicator(
                    onRefresh: _refreshData,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder:
                          (context, index) => SkeletonLoaderWidget(),
                    ),
                  );
                }
                else if (snapshot.hasError){
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty){
                  return Center(
                    child: Text("No product avalabile"),
                  );
                } else {
                  List<Product> products = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      Product product = products[index];
                      return CartItemWidget(
                        title: product.title,
                        price: product.price,
                        brand: product.brand,
                        discountPercentage: product.discountPercentage,
                        thumbnail: product.thumbnail,
                        rating: product.rating
                      );
                    },
                  );
                }
              }
            ),
          ),     
        ],
      ),
    );
  }
}

