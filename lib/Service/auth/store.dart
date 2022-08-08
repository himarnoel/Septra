import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  db(
    String uid,
    String name,
    String email,
  
  ) async {
    // String dp;
    // final path = "Users/dp${_auth.currentUser!.uid}";
    // final file = File(image!.path);
    // Reference ref = _storage.ref().child(path);

    // UploadTask upload = ref.putFile(file);
    // TaskSnapshot snapShot = await upload;
    // dp = await snapShot.ref.getDownloadURL();
    await _firestore.collection("Users").doc(uid).set({
      "uid": uid,
      "name": name,
      "email": email,
      "joined": DateTime.now(),
    });
  }
}
