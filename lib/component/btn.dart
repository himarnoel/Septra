import 'package:flutter/material.dart';
import 'package:septra/utils/helpers.dart';

class Buttonn extends StatefulWidget {
  final String texp;
  final onPressed, icon, space;
  final double text;

  Buttonn(
      {this.space,
      required this.texp,
      this.onPressed,
      required this.text,
      this.icon});

  @override
  State<Buttonn> createState() => _ButtonnState();
}

class _ButtonnState extends State<Buttonn> {
  final SizeConfig size = SizeConfig();
  @override
  Widget build(BuildContext context) {
    size.init(context);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.black,
            minimumSize: Size(getProportionateScreenWidth(330),
                getProportionateScreenHeight(65)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: widget.onPressed,
        child: Text(
          widget.texp,
          style: TextStyle(color: Colors.white, fontSize: widget.text),
        ));
  }
}

class Buttons extends StatefulWidget {
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
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  final SizeConfig size = SizeConfig();
  @override
  Widget build(BuildContext context) {
    size.init(context);
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide.merge(BorderSide(width: 1), BorderSide(width: 1)),
            primary: Colors.white,
            minimumSize: Size(getProportionateScreenWidth(330),
                getProportionateScreenHeight(70)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: widget.onTap,
        child: Text(
          "Create an Account",
          style: TextStyle(color: Colors.black, fontSize: widget.font),
        ));
  }
}

class Input extends StatelessWidget {
  final bool obscured;
  final String hintpext;
  final keyboardType;
  final icon;
  final control;
  final FormFieldValidator valid;

  Input(
      {required this.obscured,
      required this.hintpext,
      this.keyboardType,
      this.icon,
      this.control,
      required this.valid});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.of(context).textScaleFactor;

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: TextFormField(
        validator: valid,
        controller: control,
        decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 12, height: 0.2),
            filled: true,
            fillColor: const Color(0xFFF3F3F3),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            hintText: hintpext,
            prefixIcon: icon),
        style: TextStyle(fontSize: text * 15),
        keyboardType: keyboardType,
        textInputAction: TextInputAction.done,
        obscureText: obscured,
      ),
    );
  }
}

  // width: width / 1.1,
  //     height: height / 12, 





  //   height: height / 12,
      //  width: width / 1.1,