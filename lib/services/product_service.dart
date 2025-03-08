import 'dart:convert';
import 'package:ecomerce_app/constants/api_constants.dart';
import 'package:ecomerce_app/models/Product.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductService {
  final String apiUrl = ApiConstants.productApi;

  Future<List<Product>> fetchProducts() async {
    try {
      final pref = await SharedPreferences.getInstance();
      String? cacheData = pref.getString('cache_product');
      int? lastFetchTime = pref.getInt('last_fetch_time');

      // Check if cached data exists and is still valid
      if (cacheData != null && lastFetchTime != null){
        DateTime lastFetched = DateTime.fromMillisecondsSinceEpoch(lastFetchTime);
        DateTime now = DateTime.now();

        // Check if cache is older than 1 hour
        if (now.difference(lastFetched).inHours < 1) {
          final List<dynamic> cachedJson = json.decode(cacheData);

          List<Product> cacheProducts =
              cachedJson.map((json) => Product.fromJson(json)).toList();

              print("cacheProducts");
              print(cacheProducts);

          return cacheProducts;
        }
      }

      final response = await http.get(Uri.parse('${apiUrl}?limit=5'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        List<dynamic> productsJson = data['products'];

        List<Product> products =
            productsJson.map((json) => Product.fromJson(json)).toList();

        // Cache the fetched products and store the current time
        await pref.setString('cache_product', json.encode(productsJson));
        await pref.setInt('last_fetch_time', DateTime.now().millisecondsSinceEpoch);

        return products;
      } else {
        print("Failed to load products");
        throw Exception('Failed to load products');
      }
    }
    catch (e) {
      print("Error: $e");
      throw Exception('Error: $e');
    }
  }

  Future<List<Product>> fetchProductByCreatedAt({int limit = 10}) async {
    final pref = await SharedPreferences.getInstance();
    String? cacheData = pref.getString('cache_product_created_at');
    int? lastFetchTime = pref.getInt('last_fetch_time_created_at');

    // Check if cached data exists and if it is not older than 1 hour
    if (cacheData != null && lastFetchTime != null) {
      DateTime lastFetched = DateTime.fromMillisecondsSinceEpoch(lastFetchTime);
      DateTime now = DateTime.now();

      if (now.difference(lastFetched).inHours < 1) {
        // Return cached data if it's within 1 hour
        final List<dynamic> cachedJson = json.decode(cacheData);
        List<Product> cachedProducts =
            cachedJson.map((json) => Product.fromJson(json)).toList();

        return cachedProducts.take(limit).toList();
      }
    }

    try {
      // Fetch fresh data from the API if cache is invalid or expired
      final response = await http.get(Uri.parse('$apiUrl?limit=$limit'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<dynamic> productsJson = data['products'];

        List<Product> products =
            productsJson.map((json) => Product.fromJson(json)).toList();

        // Sort products by creation date in descending order
        products.sort((a, b) => b.createdAt.compareTo(a.createdAt));

        // Cache the fetched data and update the last fetch time
        await pref.setString(
          'cache_product_created_at',
          json.encode(productsJson),
        );
        await pref.setInt(
          'last_fetch_time_created_at',
          DateTime.now().millisecondsSinceEpoch,
        );

        return products.take(limit).toList();
      } else {
        throw Exception("Failed to load products from API");
      }
    } catch (error) {
      throw Exception("Failed to load products: $error");
    }
  }

  // Method to clear cache
  Future<void> clearCache() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('cache_product');
    await pref.remove('last_fetch_time');
  }

   Future<void> clearCacheFetchProductCreatedAt() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('cache_product_created_at');
    await pref.remove('last_fetch_time_created_at');
  }
}
