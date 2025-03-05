import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:ecomerce_app/widgets/bag_screen/bag_cart_widget.dart';
import 'package:ecomerce_app/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class PromoCodeWidget extends StatelessWidget {
  PromoCodeWidget({super.key});
  final TextEditingController _promoCodeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: ConfigConstants.padding2
      ),
      child: TextFieldWidget(
        hintText: "Enter your promo code",
        controller: _promoCodeController,
        obscureText: false,
        keyboardType: TextInputType.text,
        suffixIcon:  Icon(
          Icons.arrow_circle_right_sharp,
          size: 30,
          color: AppColors.primaryColor
        ),
         onPressIconButton: () {
          _onShowBottomDialog(context); // Open bottom sheet when icon is pressed
        },
        // onPressIconButton: _onShowBottomDialog,
      ) 
    );
  }

   void _onShowBottomDialog(BuildContext context){
    showModalBottomSheet(
      enableDrag: true,
      backgroundColor: AppColors.backgroundColor,
      showDragHandle: true,
      context: context, 
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: ConfigConstants.padding1
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PromoCodeWidget(),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Text(
                      "Your Promo Codes",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ConfigConstants.fontSize1,
                      ),
                    ),
                    SizedBox(height: ConfigConstants.sizebox1),
                    BagCartWidget(),
                    BagCartWidget(),
                    BagCartWidget(),
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
