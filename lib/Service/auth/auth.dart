
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:septra/Service/auth/store.dart';


class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseStorage storeage = FirebaseStorage.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final Store _store = Store();
  late String code;
  signup(
    String email,
    String password,
    BuildContext context,
    String name,
  ) async {
    try {
      UserCredential _user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(email);
      _store.db(_user.user!.uid.toString(), name, email);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          code = "Email is already in use ";
          break;
        case "user-disabled":
          code = "This account is disabled";
          break;
        case "user-not-found":
          code = "The account is found";
          break;
        case "wrong-password":
          code = "Your password is wrong";
          break;
        default:
          code = "Network Error";
      }
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: const Color(0XFF386BEE),
              title: const Text(
                "Login failed",
                style: TextStyle(color: Colors.white),
              ),
              content: Text(
                code,
                style: const TextStyle(color: Colors.white),
              ),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("ok"))
              ],
            );
          });
    }
  }

  login(String email, String password, BuildContext context) async {
    try {
      // ignore: unused_local_variable
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          code = "Invalid email";
          break;
        case "user-disabled":
          code = "This account is disabled";
          break;
        case "user-not-found":
          code = "The account is not found";
          break;
        case "wrong-password":
          code = "Your password is wrong";
          break;
        default:
          null;
      }
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: const Color(0XFF386BEE),
              title: const Text(
                "Login failed",
                style: TextStyle(color: Colors.white),
              ),
              content: Text(code,
                  style: const TextStyle(
                    color: Colors.white,
                  )),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("ok"))
              ],
            );
          });
    }
  }

 
  signOut() async {
    await _auth.signOut();
  }
}
