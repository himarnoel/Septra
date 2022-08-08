import 'package:flutter/material.dart';

import '../component/btn.dart';

class Signup extends StatelessWidget {
  static String id = "Signup";
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "SignUp",
          style: TextStyle(
              fontFamily: 'Metropolis',
              fontSize: 40,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.89,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Input(
                      obscured: false,
                      keyboardType: TextInputType.name,
                      hintpext: "Name",
                    ),
                  ),
                  Input(
                    obscured: false,
                    keyboardType: TextInputType.emailAddress,
                    hintpext: "Email",
                  ),
                  Input(
                    obscured: false,
                    keyboardType: TextInputType.number,
                    hintpext: "Number",
                  ),
                  Input(
                    obscured: false,
                    keyboardType: TextInputType.streetAddress,
                    hintpext: "Address",
                  ),
                  Input(
                    obscured: true,
                    keyboardType: TextInputType.visiblePassword,
                    hintpext: "Password",
                  ),
                  Input(
                    obscured: true,
                    keyboardType: TextInputType.visiblePassword,
                    hintpext: "Confirm Password",
                  ),
                  Buttonn(
                    height: height / 12,
                    width: width / 1.1,
                    text: text * 20,
                    onPressed: () {},
                    texp: "Signup",
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
