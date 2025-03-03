class Product {
  final String title;
  final double price;
  final String brand;
  final double discountPercentage;
  final String thumbnail;
  final double rating;

  Product({
    required this.title, 
    required this.price,
    required this.brand,
    required this.discountPercentage,
    required this.thumbnail,
    required this.rating
  });

  // Factory constructor to create Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      price: json['price'].toDouble(),
      brand: json['brand'],
      discountPercentage: json['discountPercentage'].toDouble(),
      thumbnail: json['thumbnail'],
      rating: json['rating']
    );
  }
}
