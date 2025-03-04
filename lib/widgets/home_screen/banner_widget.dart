import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  BannerWidget({super.key});

  final List<String> imageSlides = [
    "assets/images/banners/banner-1.jpg",
    "assets/images/banners/banner-2.webp",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: CarouselSlider(
            items:
              imageSlides.map((item) {
                return Image.asset(
                  item,
                  width: double.infinity,
                  fit:
                  BoxFit.cover, 
                        color: Colors.black.withOpacity(
                      0.4,
                    ),
                  colorBlendMode:
                        BlendMode.darken, 
    
                );
              }).toList(),
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.6,
              autoPlay: true,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 3),
              reverse: false,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.linearToEaseOut,
              enlargeCenterPage: true,
              enlargeFactor: 0.9,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fashsion",
                style: TextStyle(
                  fontSize: 48.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                "sale",
                style: TextStyle(
                  fontSize: 48.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.primaryColor
                  ),
                  onPressed: (){}, 
                  child: Text(
                    "Check", style: TextStyle(color: Colors.white, fontSize: ConfigConstants.fontSize1),
                  )
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}