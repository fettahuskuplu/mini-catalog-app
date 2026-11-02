import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/product.dart';

class ProductService {
  Future<List<Product>> loadProducts() async {
    final jsonString = await rootBundle.loadString('assets/data/products.json');
    final Map<String, dynamic> decoded = jsonDecode(jsonString);
    final List<dynamic> dataList = decoded['data'] as List<dynamic>? ?? [];

    return dataList
        .map((item) => Product.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
