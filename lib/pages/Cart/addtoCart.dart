import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddtoCart with ChangeNotifier {
  FirebaseFirestore _store = FirebaseFirestore.instance;

  addtoCart(
      {required String name,
      required String image,
      required int price,
      required int quantity,
      required BuildContext context}) async {
    var val = false;

    var doc = await _store
        .collection('Cart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("cart")
        .get()
        .then((value) {
      val = value.docs.any((e) => e['name'] == name);
      print(val);
    });

    if (val) {
      Fluttertoast.showToast(
          msg: "Item already added",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 18.0);
    } else {
      _store
          .collection("Cart")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("cart")
          .doc(name)
          .set({
        "name": name,
        "image": image,
        "price": quantity * price,
        "Quantity": quantity
      });
      Fluttertoast.showToast(
          msg: " Item Added to cart",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 18.0);
    }
  }

  updateQuantity({
    required name,
    required int price,
    required int quantity,
  }) async {
    var val;
    var doc = await _store
        .collection('Cart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("cart")
        .get()
        .then((value) {
      val = value.docs.any((e) => e['name'] == name);
    });
    if (val) {
      await _store
          .collection('Cart')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("cart")
          .doc(name)
          .update({"price": price, "Quantity": quantity});
      Fluttertoast.showToast(
          msg: "Added 1 quantity",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 18.0);
    }
  }
}


    // final jsonList = check.map((e) => jsonEncode(e)).toList();
    // final cleandata = jsonList.toSet().toList();
    // final result = cleandata.map((e) => jsonDecode(e)).toList();






    