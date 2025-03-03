import 'dart:convert';
import 'package:ecomerce_app/models/Product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String apiUrl = 'https://dummyjson.com/products';

  Future<List<Product>> fetchProducts() async {
    try {
      await Future.delayed(Duration(seconds: 2));

      final response = await http.get(Uri.parse('${apiUrl}?limit=5'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        List<dynamic> productsJson = data['products'];

        List<Product> products = productsJson.map((json) => Product.fromJson(json)).toList();

        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Product>> fetchProductByCreatedAt({ int limit = 10}) async {
    await Future.delayed(Duration(seconds: 2));

    final response = await http.get(Uri.parse('${apiUrl}?limit=${limit}'));

    try {
      if(response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<dynamic> productsJson = data['products'];

         List<Product> products =
            productsJson.map((json) => Product.fromJson(json)).toList();

        products.sort((a, b) => b.createdAt.compareTo(a.createdAt)); 

        return products.take(limit).toList();
      } else{
        throw Exception("Failed to load products");
      }
    } catch(error){
      throw Exception("Failed to load products: ${error}");
    }

  }
}
