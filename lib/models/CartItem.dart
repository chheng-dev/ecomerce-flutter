class CartItem {
  final int id;
  final String title;
  final double price;
  final int quantity;


  CartItem( {
    required this.id,
    required this.title, 
    required this.price, 
    required this.quantity,
  });


  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      title: json["title"],
      price: json["price"],
      quantity: json["quantity"]
    );
  }
}