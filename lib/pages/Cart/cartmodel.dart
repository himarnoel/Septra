import 'dart:convert';

class CartModel {
  final String image;
  final String name;
  final int price;
  CartModel({
    required this.image,
    required this.name,
    required this.price,
  });

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      image: map['image'] ?? '',
      name: map['name'] ?? '',
      price: map['price'] ?? 0,
    );
  }
}

List<CartModel> model = [];
