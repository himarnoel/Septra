import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Quantity {
  fetchQuantity({required String name}) async {
    var quantity;
    try {
      await FirebaseFirestore.instance
          .collection('Cart')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("cart")
          .doc(name)
          .get()
          .then((value) {
        quantity = value.data()!['Quantity'];
      });
      return quantity;
    } catch (e) {
      print(e.toString());
    }
  }
}
