import 'dart:convert';

class Product {
  final String image;
  final String name;
  final String price;
  Product({required this.name, required this.image, required this.price});

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      image: map['image'] ?? '',
      name: map['name'] ?? '',
      price: map['price'] ?? '',
    );
  }
}

List<Product> list = [];
