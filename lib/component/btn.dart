import 'package:flutter/material.dart';

class Buttonn extends StatelessWidget {
  final String texp;
  final onPressed, icon, space;
  final double width, height, text;

  Buttonn(
      {this.space,
      required this.texp,
      this.onPressed,
      required this.width,
      required this.height,
      required this.text,
      this.icon});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        primary: Colors.black,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(11))),
        elevation: 0,
      ),
      child: Text(
        texp,
        style: TextStyle(color: Colors.white, fontSize: text),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  double height;
  double width;
  double font;
  var onTap;
  Buttons(
      {Key? key,
      required this.height,
      required this.width,
      required this.font,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height / 12,
        width: width / 1.1,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(11))),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(11))),
              elevation: 0,
            ),
            onPressed: onTap,
            child: Text(
              "Create an Account",
              style: TextStyle(color: Colors.black, fontSize: font),
            )));
  }
}

class Input extends StatelessWidget {
  final bool obscured;
  final String hintpext;
  final keyboardType;
  final icon;

  Input(
      {required this.obscured,
      required this.hintpext,
      this.keyboardType,
      this.icon});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.of(context).textScaleFactor;

    return Container(
      width: width / 1.1,
      height: height / 12,
      child: Material(
        elevation: 0,
        borderRadius: BorderRadius.all(Radius.circular(11)),
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.only(left: 50, top: 10, right: 30),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none, hintText: hintpext, prefixIcon: icon),
            style: TextStyle(fontSize: text * 15),
            keyboardType: keyboardType,
            textInputAction: TextInputAction.done,
            obscureText: obscured,
          ),
        ),
      ),
    );
  }
}
