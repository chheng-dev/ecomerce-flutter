import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final String title;
  final double price;
  final String brand;
  final double? discountPercentage;
  final String thumbnail;
  final double rating;
  final String? status;

  const CartItemWidget({
    super.key, 
    required this.title, 
    required this.price, 
    required this.brand, 
    required this.thumbnail, 
    required this.rating,
    this.discountPercentage = 0,
    this.status
  });

  double _fullPriceBeforeDiscount(){
    // price = 80 
    // dis = 20%
    // full_price = 80 / ( 1 - 20/100)
    return price / (1 - (discountPercentage! / 100));
  }

  int _getFullStars(){
    return rating.floor();
  }

  Map<String, int> getHalfAndEmptyStar() {
    int fullStars = _getFullStars();
    int halfStars = (rating - fullStars) > 0.5 ? 1 : 0;
    int emptyStar = 5 - fullStars - halfStars;

    return {
      'halfStar': halfStars,
      'emptyStar': emptyStar
    };
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      width: MediaQuery.of(context).size.width / 2.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Image.network(
                  "${thumbnail}",
                  fit: BoxFit.cover,
                  height: 180,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Column(
                  children: [
                    if (discountPercentage is num && discountPercentage! > 0)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color:
                              AppColors
                                  .primaryColor, // Background color for the text
                          borderRadius: BorderRadius.circular(
                            14,
                          ), // Rounded corners
                        ),
                        child: Text(
                          "${discountPercentage}%",
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontSize: ConfigConstants.fontSize0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    
                    if (status is String)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(
                            14,
                          ), // Rounded corners
                        ),
                        child: Text(
                          status!,
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontSize: ConfigConstants.fontSize0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                )
              ),
            ],
          ),
          SizedBox(height: ConfigConstants.sizebox0),
          StarRatingWidget(context),
          Text("${brand}", 
            style: TextStyle(
              color: Colors.grey,
              fontSize: ConfigConstants.fontSize0,
            ),
          ),
          Text(
            "${title}",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              fontSize: ConfigConstants.fontSize0
            ),
          ),
          Row(
            children: [
              Text(
                "${_fullPriceBeforeDiscount().toStringAsFixed(2)}",
                style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.grey
                ),
              ),
              SizedBox(width: 8),
              Text(
                "${price}\$",
                style: TextStyle(
                  color: AppColors.primaryColor
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget StarRatingWidget(BuildContext context){
    int fullStars = _getFullStars();
    var stars = getHalfAndEmptyStar();
    int halfStar = stars['halfStar']!;
    int emptyStar = stars['emptyStar']!;

    if (rating == fullStars) {
      halfStar = 0;
    }

    return Row(
      children: [
        for(int i =0; i < fullStars; i++)
          Icon(
            Icons.star,
            color: Colors.amber,
            size: 16,
          ),

        for(int i=0; i < halfStar; i++)
          Icon(
            Icons.star_half,
            color: Colors.amber,
            size: 16,
          ),

        for(int i=0; i < emptyStar; i++)
          Icon(
            Icons.star_border,
            color: Colors.amber,
            size: 16,
          )
      ],
    );
  }
}