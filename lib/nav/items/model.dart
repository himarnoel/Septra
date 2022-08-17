import 'dart:convert';
import 'dart:ffi';

class Product {
  final String image;
  final String name;
  final int price;
  Product({required this.name, required this.image, required this.price});

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      image: map['image'] ?? '',
      name: map['name'] ?? '',
      price: map['price'] ?? 0,
    );
  }
}

List<Product> list = [];
