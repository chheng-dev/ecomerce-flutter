import 'package:flutter/material.dart';

class StarRatingWidget extends StatelessWidget {
  const StarRatingWidget({super.key, required this.rating});

  final double rating;

  int get _fullStars {
    return rating.floor();
  }

  Map<String, int> get _halfAndEmptyStars {
    int fullStars = _fullStars;
    int halfStars = (rating - fullStars) >= 0.5 ? 1 : 0;
    int emptyStar = 5 - fullStars - halfStars;

    return {'halfStar': halfStars, 'emptyStar': emptyStar};
  }

  @override
  Widget build(BuildContext context) {
    var stars = _halfAndEmptyStars;
    int fullStars = _fullStars;
    int halfStar = stars['halfStar']!;
    int emptyStar = stars['emptyStar']!;

    // If the rating is a whole number, no half star is needed.
    if (rating == fullStars) {
      halfStar = 0;
    }

    return Row(
      children: [
        for (int i = 0; i < fullStars; i++)
          Icon(Icons.star, color: Colors.amber, size: 16),
        for (int i = 0; i < halfStar; i++)
          Icon(Icons.star_half, color: Colors.amber, size: 16),
        for (int i = 0; i < emptyStar; i++)
          Icon(Icons.star_border, color: Colors.amber, size: 16),
      ],
    );
  }
}
