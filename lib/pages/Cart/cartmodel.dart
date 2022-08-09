import 'dart:convert';

class CartModel {
  final String image;
  final String name;
  final String price;
  CartModel({
    required this.image,
    required this.name,
    required this.price,
  });

  

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      image: map['image'] ?? '',
      name: map['name'] ?? '',
      price: map['price'] ?? '',
    );
  }

 
}

List<CartModel> model = [
 
];
