import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AddtoCart with ChangeNotifier {
  FirebaseFirestore _store = FirebaseFirestore.instance;

  addtoCart({
    required String name,
    required String image,
    required String price,
  }) async {
    List cart = [];
    List check = [];
    Map val = {"name": name, "image": image, "price": price, "Quantity": 1};
    cart.add(val);

    ///to avoid duplicate
    final jsonList = cart.map((e) => jsonEncode(e)).toList();
    final cleandata = jsonList.toSet().toList();
    final result = cleandata.map((e) => jsonDecode(e)).toList();

    await _store
        .collection("Cart")
        .get()
        .then((value) => value.docs.forEach((e) {
              e.data()["cart"].forEach((dat) {
                check.add(dat);
              });
              notifyListeners();
            }));

    if (check.isEmpty) {
      _store
          .collection("Cart")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({"cart": result});
    } else {
      _store
          .collection("Cart")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"cart": FieldValue.arrayUnion(result)});
    }
    notifyListeners();
  }
}
