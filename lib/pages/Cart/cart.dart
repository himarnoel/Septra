import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:septra/Service/auth/auth.dart';
import 'package:septra/pages/Cart/cartmodel.dart';

import '../../../utils/helpers.dart';
import 'cartui.dart';

class Cart extends StatefulWidget {
  static String id = "cart";
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int val = 1;
  final SizeConfig size = SizeConfig();
  @override
  Widget build(BuildContext context) {
    size.init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("My Cart"),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewport) {
        return ListView.builder(
          itemCount: model.length,
          itemBuilder: (context, index) {
            return CartCard(viewport: viewport, i: index);
          },
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        color: Colors.white,
        child: Row(
          children: [
            const Expanded(
              child: ListTile(
                title: Text(
                  "Total Price",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                subtitle: Text(
                  "\$585.00",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    minimumSize: Size(getProportionateScreenWidth(92),
                        getProportionateScreenHeight(60)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Checkout",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
