import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  fetch() {
    model.clear();
    var documentStream = FirebaseFirestore.instance
        .collection('Cart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((event) {
      event.data()!['cart'].forEach(
        (e) {
          model.add(CartModel.fromMap(e));
        },
      );
      setState(() {});
    });
  }

  int val = 1;
  final SizeConfig size = SizeConfig();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

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
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView.builder(
            itemCount: model.length,
            itemBuilder: (context, index) {
              return CartCard(viewport: viewport, i: index);
            },
          ),
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
                title: Text("Total Price"),
                subtitle: Text(
                  "\$585.00",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
