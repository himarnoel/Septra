import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:septra/pages/land.dart';
import 'package:septra/pages/signin.dart';

import '../../nav/nav.dart';

class Gate extends StatefulWidget {
  static String id = "gate";
  const Gate({Key? key}) : super(key: key);

  @override
  State<Gate> createState() => _GateState();
}

class _GateState extends State<Gate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.active) {
            const Center(
              child: CircularProgressIndicator(),
            );
            if (snapshot.hasData) {
              return const Nav();
            }
          }
          return const Login();
        });
  }
}
