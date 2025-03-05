import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:ecomerce_app/widgets/bag_screen/bag_cart_widget.dart';
import 'package:ecomerce_app/widgets/bag_screen/promo_code_widget.dart';
import 'package:ecomerce_app/widgets/button.dart';
import 'package:flutter/material.dart';

class BagScreen extends StatelessWidget {
 const BagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.search
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ConfigConstants.padding1,
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: ConfigConstants.padding1,
                  ),
                  child: Text(
                    "My Bag",
                    style: TextStyle(
                      fontSize: ConfigConstants.fontSize3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                BagCartWidget(),
                BagCartWidget(),
                BagCartWidget(),
                BagCartWidget(),
                BagCartWidget(),
                
                // Promote code
                PromoCodeWidget(),

                // Total amout
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: ConfigConstants.padding0
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total amount:",
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      ),
                      Text(
                        "\$124",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: ConfigConstants.fontSize1
                        ),
                      )
                    ],
                  ),
                ),

                // Check out
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: ConfigConstants.padding1
                  ),
                  child: ButtonWidget(
                    btn_title: "CHECK OUT", 
                    onSubmit: (){}
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}