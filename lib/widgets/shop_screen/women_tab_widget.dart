import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:ecomerce_app/widgets/button.dart';
import 'package:ecomerce_app/widgets/shop_screen/card_main_category.dart';
import 'package:ecomerce_app/widgets/shop_screen/list_categories_wideget.dart';
import 'package:flutter/material.dart';

class WomenTabWidget extends StatelessWidget {
  WomenTabWidget({super.key});

  final List<Map<String, String>> womenCategoryMianList = [
    {
      "title": "New",
      "image_url": "https://www.boden.com/cdn/shop/files/1470806_SS25_FEB_WK05_SHIRTS_WW_PLP_M_HERO.jpg?v=1738142928&width=1420"
    },
    {
      "title": "Chothes",
      "image_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_Soq7C_7wJvXLpYUJCX0RTXIb5e-J5w9ZXA&s"
    },
    {
      "title": "Shoes",
      "image_url": "https://media.istockphoto.com/id/865111460/photo/fashion-flatlay-variety-of-the-colorful-woman-shoes-on-white-marble-elegant-background.jpg?s=612x612&w=0&k=20&c=DQ0iFRX81rMWWBrJnLR1VhIXRJCjpHAHNB9FckJ8c_Q="
    },
    {
      "title": "Accessories",
      "image_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5FySXdHpmwENyNmBzH8SCPd3KqPdM4B-Ddw&s"
    },
  ];

  List<String> womenShoppingCategories = [
    'Clothing',
    'Footwear',
    'Accessories',
    'Beauty',
    'Activewear',
    'Lingerie',
    'Outerwear',
    'Swimwear',
    'Home',
    'Tech & Gadgets',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ConfigConstants.padding2,
        vertical: ConfigConstants.padding2
      ),
      child: ListView(
        children: [
          // Summer sales
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12)
            ),
            child: ListTile(
              title: Text(
                "SUMMER SLAES",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: ConfigConstants.fontSize3,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(
                "Up to 50% off",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: ConfigConstants.fontSize2,
                  color: Colors.white
                ),
              ),
            ),
          ),
          SizedBox(height: ConfigConstants.sizebox1),

          // List Category Main
          ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: womenCategoryMianList.length,
            itemBuilder: (context, index) {
              final category = womenCategoryMianList[index];
              final title = category["title"]!;
              final image_url = category["image_url"]!;

              return CardMainCategoryWidget(
                title: title, 
                image_url: image_url
              );
            },
          ),
          SizedBox(height: ConfigConstants.sizebox1),
          ButtonWidget(
            btn_title: "VIEW ALL ITEMS", 
            onSubmit: (){}
          ),
          SizedBox(height: ConfigConstants.sizebox1),
          // List Categories
          ListCategoriesWidget(categories: womenShoppingCategories),
        ],
      ),
    );
  }
}