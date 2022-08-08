
import 'package:flutter/material.dart';

import '../component/btn.dart';
import '../nav/home.dart';
import '../nav/nav.dart';
import '../utils/helpers.dart';

class Login extends StatefulWidget {
  static String id = "Login";

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  SizeConfig size = SizeConfig();
  @override
  Widget build(BuildContext context) {
    size.init(context);
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
            "Login",
            style: TextStyle(
                fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewport) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: viewport.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Add your details to login",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: height * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Input(
                            obscured: false,
                            keyboardType: TextInputType.emailAddress,
                            hintpext: "Email",
                          ),
                          Input(
                            obscured: true,
                            keyboardType: TextInputType.visiblePassword,
                            hintpext: "Password",
                          ),
                          Buttonn(
                            height: height / 12,
                            width: width / 1.1,
                            text: text * 20,
                            texp: "Login",
                            onPressed: () {
                              Navigator.pushNamed(context, Nav.id);
                            },
                          ),
                          const Text(
                            "Forgot your Password ?",
                            style: TextStyle(
                                fontFamily: 'Metropolis',
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    Buttonn(
                      height: height / 12,
                      width: width / 1.1,
                      text: text * 20,
                      texp: "Sign in with Google",
                      onPressed: () {
                        Navigator.pushNamed(context, Nav.id);
                      },
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Buttonn(
                      height: height / 12,
                      width: width / 1.1,
                      text: text * 20,
                      texp: " Sign in with Facebook",
                      onPressed: () {
                        Navigator.pushNamed(context, Nav.id);
                      },
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an Account?"),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(" Signup",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
