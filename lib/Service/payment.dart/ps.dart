import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymenState();
}

class _PaymenState extends State<Payment> {
   String email = "olaokunade@gmail.com";

  final plans = [
    {"price": 500, "items": 4, "product_id": 4},
    {"price": 1000, "items": 6, "product_id": 6},
    {"price": 3500, "items": 9, "product_id": 9},
    {"price": 5600, "items": 10, "product_id": 10},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Text('')
        ],
      )
    );
  }
}