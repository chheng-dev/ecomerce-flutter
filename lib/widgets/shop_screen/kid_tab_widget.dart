import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:ecomerce_app/widgets/button.dart';
import 'package:ecomerce_app/widgets/shop_screen/card_main_category.dart';
import 'package:ecomerce_app/widgets/shop_screen/list_categories_wideget.dart';
import 'package:flutter/material.dart';

class KidTabWidget extends StatelessWidget {
  KidTabWidget({super.key});

  final List<Map<String, String>> kidCategoryMainList = [
    {
      "title": "Boys Clothing",
      "image_url": "https://www.babybooshop.in/cdn/shop/collections/IMG_3826_jpg.webp?v=1724854894",
    },
    {
      "title": "Girls Clothing",
      "image_url": "https://m.media-amazon.com/images/I/81oi3wfALQL.jpg",
    },
    {
      "title": "Toys & Games",
      "image_url": "https://m.media-amazon.com/images/I/71qaxCjW9pL._AC_UF1000,1000_QL80_.jpg",
    },
    {
      "title": "Kids Footwear",
      "image_url": "https://cdn.shopify.com/s/files/1/0004/0245/6582/files/shoes_mobile_hero.jpg",
    },
    {
      "title": "Educational Material",
      "image_url": "https://m.media-amazon.com/images/I/91H8qsiz+pL._AC_UF894,1000_QL80_.jpg",
    },
  ];

  List<String> kidsShoppingCategories = [
    'Toys & Games',
    'Kids Footwear',
    'Educational Material',
    'Kids Accessories',
    'School Supplies',
    'Kids Outerwear',
    'Baby Gear',
    'Fun & Learning',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ConfigConstants.padding2,
        vertical: ConfigConstants.padding2,
      ),
      child: ListView(
        children: [
          // List Category Main
          ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: kidCategoryMainList.length,
            itemBuilder: (context, index) {
              final category = kidCategoryMainList[index];
              final title = category["title"]!;
              final image_url = category["image_url"]!;

              return CardMainCategoryWidget(title: title, image_url: image_url);
            },
          ),
          SizedBox(height: ConfigConstants.sizebox1),
          ButtonWidget(btn_title: "VIEW ALL ITEMS", onSubmit: () {}),
          SizedBox(height: ConfigConstants.sizebox1),
          // List Categories
          ListCategoriesWidget(categories: kidsShoppingCategories),
        ],
      ),
    );
 }
}