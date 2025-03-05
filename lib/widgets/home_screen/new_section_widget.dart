import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:ecomerce_app/controllers/product_controller.dart';
import 'package:ecomerce_app/models/Product.dart';
import 'package:ecomerce_app/widgets/cart_item_widget.dart';
import 'package:ecomerce_app/widgets/header_section_widget.dart';
import 'package:ecomerce_app/widgets/skeleton_loader_widget.dart';
import 'package:flutter/material.dart';

class NewSectionWidget extends StatelessWidget {
  NewSectionWidget({super.key});

  final ProductController _controller = ProductController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSectionWidget(
            title: "New",
            sub_title: "You're never seen it before!",
          ),
          SizedBox(height: ConfigConstants.sizebox1),
          SizedBox(
            width: double.infinity,
            height: 300,
            child: FutureBuilder<List<Product>>(
              future: _controller.filterProductByCreatedAt(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5, 
                    itemBuilder: (context, index) => SkeletonLoaderWidget(),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No product available"));
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
                        thumbnail: product.thumbnail,
                        rating: product.rating,
                        status: "New",
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
