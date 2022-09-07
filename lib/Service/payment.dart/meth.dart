import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter/material.dart';
import 'package:septra/Service/payment.dart/key.dart';
import 'package:septra/nav/home.dart';
import 'package:septra/nav/nav.dart';

class PayNow {
  String email;
  int price;
  BuildContext ctx;

  PayNow({required this.email, required this.price, required this.ctx});

  // ref cardui, plugin, chargefunc, call;
  var paystack = PaystackPlugin();

  _getRef() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }
    return 'chargedForm${platform}_${DateTime.now().microsecondsSinceEpoch}';
  }

  cardUi() {
    return PaymentCard(number: "", cvc: "", expiryMonth: 0, expiryYear: 0);
  }

  Future initializePlugin() async {
    return await paystack.initialize(publicKey: ConstantKey.pay_key);
  }

  chargeNow(BuildContext context) async {
    initializePlugin().then((_) async {
      Charge charge = Charge()
        ..amount = price
        ..email = email
        ..reference = _getRef()
        ..card = cardUi();
      // ..currency = 'USD';
      // ..locale = 'US';
      CheckoutResponse response = await paystack.checkout(ctx,
          charge: charge,
          method: CheckoutMethod.card,
          logo: Image.asset(
            'lib/images/logo/log.png',
            scale: 15,
          ));
      print(response);
      if (response.status) {
        // print(response.message);
        final snackBar = SnackBar(
          content: const Text(
            'Payment Successful',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: (Colors.black),
          action: SnackBarAction(
            label: 'dismiss',
            onPressed: () {
              FirebaseFirestore.instance
                  .collection("Cart")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection('cart')
                  .get()
                  .then((snapshot) {
                for (DocumentSnapshot ds in snapshot.docs) {
                  ds.reference.delete();
                }
              });
            },
          ),
        );
        FirebaseFirestore.instance
            .collection("Cart")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('cart')
            .get()
            .then((snapshot) {
          for (DocumentSnapshot ds in snapshot.docs) {
            ds.reference.delete();
          }
        });
        // Navigator.pushReplacementNamed(context, Home.id);
        // Navigator.pop(context);
        Navigator.of(context).pushNamedAndRemoveUntil(Nav.id, (route) => false);
        return ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        return response.message;
      }
    });
  }
}
