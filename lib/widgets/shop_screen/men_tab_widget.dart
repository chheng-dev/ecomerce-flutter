import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:ecomerce_app/widgets/button.dart';
import 'package:ecomerce_app/widgets/shop_screen/card_main_category.dart';
import 'package:ecomerce_app/widgets/shop_screen/list_categories_wideget.dart';
import 'package:flutter/material.dart';

class MenTabWidget extends StatelessWidget {
  MenTabWidget({super.key});
  final List<Map<String, String>> menCategoryMainList = [
    {
      "title": "New",
      "image_url":
          "https://www.sprng.co.in/cdn/shop/files/SPR005-21_7.jpg?v=1698995242&width=1200",
    },
    {
      "title": "Clothing",
      "image_url":
          "https://www.next.us/cms/resource/blob/682046/f3f21e3b7dbc3a8acb9172dc053eef1c/170924-trending-feature-1-mens-data.jpg",
    },
    {
      "title": "Shoes",
      "image_url":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS67KhtFemUwYuX51nLOYVVwsYl8AelDH7Dig&s",
    },
    {
      "title": "Accessories",
      "image_url":
          "https://theodoredesigns.myshopify.com/cdn/shop/articles/2023-03-07_21_40_58-best_of_the_best_in_mens_accessories_at_DuckDuckGo_-_Brave.png?v=1678185762",
    },
  ];

  List<String> menShoppingCategories = [
    'Clothing',
    'Footwear',
    'Accessories',
    'Activewear',
    'Tech & Gadgets',
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
            itemCount: menCategoryMainList.length,
            itemBuilder: (context, index) {
              final category = menCategoryMainList[index];
              final title = category["title"]!;
              final image_url = category["image_url"]!;

              return CardMainCategoryWidget(title: title, image_url: image_url);
            },
          ),
          SizedBox(height: ConfigConstants.sizebox1),
          ButtonWidget(btn_title: "VIEW ALL ITEMS", onSubmit: () {}),
          SizedBox(height: ConfigConstants.sizebox1),
          // List Categories
          ListCategoriesWidget(categories: menShoppingCategories),
        ],
      ),
    );
  }
}