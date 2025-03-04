import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class ListCategoriesWidget extends StatelessWidget {
  final List<String> categories;
  const ListCategoriesWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose category",
            style: TextStyle(
              color: Colors.black45
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: categories.length,
            itemBuilder:(context, index){
              final category = categories[index];
              return Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: ConfigConstants.padding1
                ),
                decoration: BoxDecoration(
                 border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                    width: 1
                  )
                 )
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    
                  ),
                )
              );
            },
          )
        ],
      ),
    );
  }
}