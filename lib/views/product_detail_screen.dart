import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:ecomerce_app/widgets/avalible_stock_widget.dart';
import 'package:ecomerce_app/widgets/option_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce_app/controllers/product_controller.dart';
import 'package:ecomerce_app/models/Product.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key, required this.id});

  final int id;
  final ProductController _productController = ProductController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Product>(
        future: _productController.getProductById(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return Center(child: Text('Product not found.'));
          } else {
            Product product = snapshot.data!;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 250.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: _buildImageSlider(context, product),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        _buildProductDetail(product),
                        Divider(),
                        OptionTypeWidget(product: product),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: ConfigConstants.margin1
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: ConfigConstants.padding1
                    ),
                    color: AppColors.lightColor,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: AppColors.lightColor,
                        child: Image.network(
                          'https://cdn.britannica.com/94/193794-050-0FB7060D/Adidas-logo.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text("Adidas Brand"),
                      subtitle: Text(
                        "803 products available",
                        style: TextStyle(color: AppColors.greyColor),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      vertical: ConfigConstants.margin2,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: ConfigConstants.padding1,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You may also like",
                          style: TextStyle(
                            fontSize: ConfigConstants.fontSize1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // RelatedProductWidget()
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

Widget _buildImageSlider(BuildContext context, Product product) {
  List<String> images = product.images ?? [];
  return CarouselSlider(
    items:
      images.map((item) {
        return Image.network(
          item,
          width: double.infinity,
          fit: BoxFit.cover,
          loadingBuilder: (
            BuildContext context,
            Widget child,
            ImageChunkEvent? loadingProgress,
          ) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(
                  value:
                      loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.expectedTotalBytes != null
                              ? (loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1))
                              : null
                          : null,
                ),
              );
            }
          },
        );
      }).toList(),
    options: CarouselOptions(
    height: MediaQuery.of(context).size.height * 0.4,
      autoPlay: true,
      viewportFraction: 1,
    ),
  );
}

Widget _buildProductDetail(Product product) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: ConfigConstants.padding2,
      vertical:  ConfigConstants.padding1
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.title,
              style: TextStyle(
                fontSize: ConfigConstants.fontSize2,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "\$${product.price}",
              style: TextStyle(
                fontSize: ConfigConstants.fontSize1,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor
              ),
            )
          ],
        ),
        Text(
          product.brand,
          style: TextStyle(
            fontSize: ConfigConstants.fontSize0, 
            color: AppColors.greyColor
          ),
        ),
        SizedBox(height: 10),
        AvalibleStockWidget(product: product),
      ],
    ),
  );
}
