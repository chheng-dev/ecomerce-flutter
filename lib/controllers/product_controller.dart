import 'package:ecomerce_app/models/Product.dart';
import 'package:ecomerce_app/services/product_service.dart';

class ProductController {
  final ProductService _productService = ProductService();
  
  Future<List<Product>> getProducts() async {
    return await _productService.fetchProducts();
  }

  Future<List<Product>> filterProductByCreatedAt() async {
    return await _productService.fetchProductByCreatedAt();
  }
}