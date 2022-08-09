import 'package:flutter/material.dart';
import 'package:septra/Service/Other_Service/gate.dart';

import '../component/btn.dart';

import 'signup.dart';

class Land extends StatelessWidget {
  static String id = "/";

  const Land({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.of(context).textScaleFactor;
    //final text = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Image.asset(
                    "lib/images/logo/log.png",
                    scale: 6,
                  ),
                  const Text("Get the best of your Gadget here"),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Discover the best phones, tablets and watch  from over 1,000 restaurants and fast delivery to your doorstep",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Buttonn(
                            text: text * 18,
                            texp: "Login",
                            onPressed: () {
                              Navigator.pushNamed(context, Gate.id);
                            }),
                      ),
                      Buttons(
                        height: height,
                        width: width,
                        font: text * 18,
                        onTap: () {
                          Navigator.pushNamed(context, Signup.id);
                        },
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
