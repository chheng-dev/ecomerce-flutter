import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class BagCartWidget extends StatelessWidget {
  const BagCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8.0
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12)
            ),
            child: Image.network(
              "https://www.headcovers.com/media/catalog/product/cache/8808087f0bed3ffff8ae10dad7430857/l/a/lauren-upf-cotton-sun-hat-for-women-226.jpg"
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: ConfigConstants.padding1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Pullover",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: ConfigConstants.fontSize1
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Color:",
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Black",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(width: 16),
                      Text(
                        "Size:",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "L",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  SizedBox(height: ConfigConstants.sizebox1),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.1, 0.1),
                              blurRadius: 1.0
                            )
                          ]
                        ),
                        child: Icon(
                          Icons.remove,
                          size: 28.0,
                          color: AppColors.greyColor,
                        ),
                      ),
                      SizedBox(width: ConfigConstants.sizebox0),
                      Text(
                        "1",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: ConfigConstants.fontSize1
                        ),
                      ),
                      SizedBox(width: ConfigConstants.sizebox0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.1, 0.1),
                              blurRadius: 1.0
                            )
                          ]
                        ),
                        child: Icon(
                          Icons.add,
                          size: 28.0,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ConfigConstants.padding1,
              vertical: ConfigConstants.padding1,
            ),                    child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Icon(
                    Icons.more_vert_outlined,
                    color: Colors.grey,
                  ),
                ),            
                Container(
                    child: Text(
                    "\$55",
                    style: TextStyle(
                      fontSize: ConfigConstants.fontSize2,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}