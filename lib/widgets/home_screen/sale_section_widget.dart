import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:ecomerce_app/controllers/product_controller.dart';
import 'package:ecomerce_app/models/Product.dart';
import 'package:ecomerce_app/widgets/cart_item_widget.dart';
import 'package:ecomerce_app/widgets/header_section_widget.dart';
import 'package:flutter/material.dart';

class SaleSectionWidget extends StatelessWidget {
  SaleSectionWidget({super.key});
    
  final ProductController _controller = ProductController();

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
              future: _controller.getProducts(), 
              builder: (context, snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
    // Show skeleton loader while waiting for data
                    // return SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal, // Allow scrolling if the content overflows
                    //   child: Row(
                    //     children: List.generate(5, (index) {
                    //       return Padding(
                    //         padding: const EdgeInsets.all(8.0), // Padding between skeleton items
                    //         child: SkeletonLoader(
                    //           builder: Container(
                    //             color: Colors.red, // Skeleton background color
                    //             width: 100, // Width of the skeleton
                    //             height: 150, // Height of the skeleton
                    //           ),
                    //         ),
                    //       );
                    //     }),
                    //   ),
                    // );
                    return Center(
                      child: CircularProgressIndicator(),
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