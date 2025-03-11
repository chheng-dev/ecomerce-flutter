class Product {
  final int id;
  final String title;
  final double price;
  final String brand;
  final String? description;
  final double discountPercentage;
  final String thumbnail;
  final double rating;
  final DateTime createdAt;
  final List<String>? images;
  final int? stock;

  Product({
    required this.id,
    required this.title, 
    required this.price,
    required this.brand,
    required this.discountPercentage,
    required this.thumbnail,
    required this.rating,
    required this.createdAt,
    this.stock,
    this.images,
    this.description,
  });

  // Factory constructor to create Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      brand: json['brand'],
      discountPercentage: json['discountPercentage'].toDouble(),
      thumbnail: json['thumbnail'],
      rating: json['rating'],
      stock: json['stock'],
      images: List<String>.from(json['images']),
      createdAt: DateTime.parse(json['meta']['createdAt']),
    );
  }
}
