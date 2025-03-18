import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:ecomerce_app/controllers/product_controller.dart';
import 'package:ecomerce_app/models/Product.dart';
import 'package:ecomerce_app/widgets/header_section_widget.dart';
import 'package:ecomerce_app/widgets/item_widget.dart';
import 'package:ecomerce_app/widgets/skeleton_loader_widget.dart';
import 'package:flutter/material.dart';

class NewSectionWidget extends StatefulWidget {
  NewSectionWidget({super.key});

  @override
  State<NewSectionWidget> createState() => _NewSectionWidgetState();
}

class _NewSectionWidgetState extends State<NewSectionWidget> {
  final ProductController _productController = ProductController();
  late Future<List<Product>> _productFuture;

  @override
  void initState() {
    super.initState();
    _productFuture = _productController.filterProductByCreatedAt();
  }

  Future<void> _refreshData() async {
    await _productController.clearCacheFetchByCreatedAt(() {
      setState(() {
        _productFuture = _productController.filterProductByCreatedAt();
      });
    });
  }

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
              future: _productFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return RefreshIndicator(
                    onRefresh: _refreshData,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5, 
                      itemBuilder: (context, index) => SkeletonLoaderWidget(),
                    ),
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
                      return ItemWidget(
                        id: product.id,
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
