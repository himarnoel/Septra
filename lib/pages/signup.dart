import 'package:flutter/material.dart';

import '../Service/auth/auth.dart';
import '../component/btn.dart';

class Signup extends StatefulWidget {
  static String id = "Signup";
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _passwordVisible = true;
  String confirmPass = "";
  bool increase = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _namecont = TextEditingController();
  final TextEditingController _emailCont = TextEditingController();
  final TextEditingController _passcont = TextEditingController();

  final Auth _auth = Auth();
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
          child: SizedBox(
            height: increase
                ? MediaQuery.of(context).size.height * 0.97
                : MediaQuery.of(context).size.height * 0.87,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Input(
                            control: _namecont,
                            obscured: false,
                            keyboardType: TextInputType.name,
                            hintpext: "Name",
                            valid: (val) {
                              setState(() {
                                increase = true;
                              });
                              if (val.isEmpty) {
                                return "Please Enter your name";
                              } else {
                                return null;
                              }
                            }),
                      ),
                      SizedBox(
                        height: height / 20,
                      ),
                      Input(
                        control: _emailCont,
                        obscured: false,
                        keyboardType: TextInputType.emailAddress,
                        hintpext: "Email",
                        valid: (val) {
                          if (val.isEmpty) {
                            return "Please an Email";
                          } else {
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val);
                            if (emailValid == true) {
                              return null;
                            } else {
                              return "Enter a correct email";
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: height / 20,
                      ),
                      Input(
                          obscured: false,
                          keyboardType: TextInputType.phone,
                          hintpext: "Number",
                          valid: (val) {
                            if (val.isEmpty) {
                              return "Please Enter your phone number";
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(
                        height: height / 20,
                      ),
                      Input(
                          obscured: false,
                          keyboardType: TextInputType.streetAddress,
                          hintpext: "Address",
                          valid: (val) {
                            if (val.isEmpty) {
                              return "Please Enter your Home Address";
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(
                        height: height / 20,
                      ),
                      Input(
                          obscured: true,
                          keyboardType: TextInputType.visiblePassword,
                          hintpext: "Password",
                          valid: (val) {
                            confirmPass = val;
                            if (val.isEmpty) {
                              return "Please Re-Enter New Password";
                            } else if (val.length < 8) {
                              return "Password must be at least 8 characters long";
                            } else if (!RegExp(r"[a-z]").hasMatch(val)) {
                              return "Password must contain at least a small letter";
                            } else if (!RegExp(r"[A-Z]").hasMatch(val)) {
                              return "Password must contain at least a Capital letter";
                            } else if (!RegExp(r"[0-9]").hasMatch(val)) {
                              return "Password must contain at least a number";
                            } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                                .hasMatch(val)) {
                              return "Password must contain atleast a special character";
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(
                        height: height / 20,
                      ),
                      Input(
                        control: _passcont,
                        obscured: true,
                        keyboardType: TextInputType.visiblePassword,
                        hintpext: "Confirm Password",
                        valid: (val) {
                          if (val.isEmpty) {
                            return "Please Re-Enter New Password";
                          } else if (val.length < 8) {
                            return "Password must be at least 8 characters long";
                          } else if (!RegExp(r"[a-z]").hasMatch(val)) {
                            return "Password must contain at least a small letter";
                          } else if (!RegExp(r"[A-Z]").hasMatch(val)) {
                            return "Password must contain at least a Capital letter";
                          } else if (!RegExp(r"[0-9]").hasMatch(val)) {
                            return "Password must contain atleast a number";
                          } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                              .hasMatch(val)) {
                            return "Password must contain at least a special character";
                          } else if (val != confirmPass) {
                            return "Password do not match";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Buttonn(
                  text: text * 20,
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _auth.signup(
                          _emailCont.text.trim(),
                          _passcont.text.trim(),
                          context,
                          _namecont.text.trim());
                    }
                  },
                  texp: "Signup",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
