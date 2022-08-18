import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:septra/Service/auth/auth.dart';
import 'package:septra/pages/Cart/cartmodel.dart';
import 'package:septra/pages/checkout/checkout.dart';

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
        return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Cart')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('cart')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              final data = snapshot.data;
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView.builder(
                  itemCount: snapshot.data?.size,
                  itemBuilder: (context, i) {
                    return CartCard(viewport: viewport, i: data!.docs[i]);
                  },
                ),
              );
            });
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        color: Colors.white,
        child: Row(
          children: [
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Cart')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('cart')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  var price = 0;
                  snapshot.data?.docs.forEach((e) {
                    price += e.get('price') as int;
                  });
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Expanded(
                    child: ListTile(
                      title: Text("Total Price"),
                      subtitle: Text(
                        "\$ ${price}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    minimumSize: Size(getProportionateScreenWidth(92),
                        getProportionateScreenHeight(60)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.pushNamed(context,Checkout.id);
                },
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
