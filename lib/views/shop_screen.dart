import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:ecomerce_app/widgets/shop_screen/kid_tab_widget.dart';
import 'package:ecomerce_app/widgets/shop_screen/men_tab_widget.dart';
import 'package:ecomerce_app/widgets/shop_screen/women_tab_widget.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({super.key});

  final List<String> categoryTabs = [
    "Women", "Men", "Kids"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categoryTabs.length, 
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/");
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            "Categories",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          bottom: TabBar(
            indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            indicatorColor: AppColors.primaryColor,
            labelColor: AppColors.blackColor,
            indicatorWeight: 4.0,
            tabs: categoryTabs
            .map((category) => SizedBox(
                  height: 40, 
                  child: Center(
                    child: Text(
                      category,
                      style: TextStyle(
                        fontSize: 20
                      ),
                    )
                  ),
                ),
              )
            .toList(),
          ),
        ),
        body: TabBarView(
          children: [
            WomenTabWidget(),
            MenTabWidget(),
            KidTabWidget()
          ],
        ),
      ),
    );
  }
}
