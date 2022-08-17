import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:septra/pages/Cart/addtoCart.dart';
import 'package:septra/utils/helpers.dart';

import 'cartmodel.dart';

class CartCard extends StatefulWidget {
  final viewport;
  final i;
  const CartCard({
    Key? key,
    this.viewport,
    required this.i,
  }) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  final AddtoCart _addtoCart = AddtoCart();
  SizeConfig sizeConfig = SizeConfig();
  int val = 1;

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 120,
      ),
      child: IntrinsicHeight(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                height: getProportionateScreenHeight(120),
                width: getProportionateScreenWidth(320),
                padding: const EdgeInsets.only(
                  left: 8,
                ),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 232, 230, 230)
                            .withOpacity(1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                      height: getProportionateScreenHeight(100),
                      width: getProportionateScreenWidth(100),
                      child: Image.network(
                        widget.i["image"],
                        scale: 8,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: getProportionateScreenWidth(8),
                            ),
                            Text(
                              widget.i["name"],
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(40),
                            ),
                            IconButton(
                                onPressed: () {
                                  // widget.i.reference.delete();

                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Remove(
                                        i: widget.i,
                                      );
                                    },
                                    shape: const RoundedRectangleBorder(
                                      // <-- SEE HERE
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25.0),
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: getProportionateScreenWidth(15),
                            ),
                            Text(
                              widget.i["price"].toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(36),
                            ),
                            Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                height: getProportionateScreenHeight(38),
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    IconButton(
                                        splashRadius: 10,
                                        onPressed: () {
                                          var minus;
                                          minus = widget.i["Quantity"];
                                          minus--;
                                          var price = widget.i["price"] / val;
                                          _addtoCart.updateQuantity(
                                              name: widget.i["name"],
                                              price: price,
                                              quantity: minus);

                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          size: 18,
                                        )),
                                    Text(
                                      widget.i["Quantity"].toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                        iconSize: 18,
                                        splashRadius: 10,
                                        onPressed: () {
                                          var plus = 1;
                                          setState(() {
                                            plus = widget.i["Quantity"];
                                          });
                                          plus++;
                                          _addtoCart.updateQuantity(
                                              name: widget.i["name"],
                                              price: widget.i["price"],
                                              quantity: plus);
                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          size: 18,
                                        )),
                                  ],
                                )),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Remove extends StatefulWidget {
  final i;
  const Remove({
    Key? key,
    required this.i,
  }) : super(key: key);

  @override
  State<Remove> createState() => _RemoveState();
}

class _RemoveState extends State<Remove> {
  final AddtoCart _addtoCart = AddtoCart();
  SizeConfig sizeConfig = SizeConfig();
  int val = 1;

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return Container(
      height: getProportionateScreenHeight(300),
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Remove From Cart?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Container(
            height: getProportionateScreenHeight(120),
            width: getProportionateScreenWidth(320),
            padding: const EdgeInsets.only(
              left: 8,
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 232, 230, 230).withOpacity(1),
                spreadRadius: 0,
                blurRadius: 2,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Container(
                  height: getProportionateScreenHeight(100),
                  width: getProportionateScreenWidth(100),
                  child: Image.network(
                    widget.i["image"],
                    scale: 8,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: getProportionateScreenWidth(8),
                          height: getProportionateScreenHeight(55),
                        ),
                        Text(
                          widget.i["name"],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(40),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: getProportionateScreenWidth(15),
                        ),
                        Text(
                          widget.i["price"].toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(36),
                        ),
                        Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            height: getProportionateScreenHeight(38),
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                IconButton(
                                    splashRadius: 10,
                                    onPressed: () {
                                      var minus;
                                      setState(() {
                                        minus = widget.i["Quantity"];
                                        minus--;
                                      });
                                      print(minus);
                                      _addtoCart.updateQuantity(
                                          name: widget.i["name"],
                                          price: widget.i["price"],
                                          quantity: minus);

                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                      size: 18,
                                    )),
                                Text(
                                  widget.i["Quantity"].toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                    iconSize: 18,
                                    splashRadius: 10,
                                    onPressed: () {
                                      var plus = 1;
                                      setState(() {
                                        plus = widget.i["Quantity"];
                                      });
                                      plus++;
                                      _addtoCart.updateQuantity(
                                          name: widget.i["name"],
                                          price: widget.i["price"],
                                          quantity: plus);
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      size: 18,
                                    )),
                              ],
                            )),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          // Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Color(0XFFFE7E7E7),
                    minimumSize: Size(getProportionateScreenWidth(92),
                        getProportionateScreenHeight(60)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(fontSize: 15.8),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.black,
                    minimumSize: Size(getProportionateScreenWidth(92),
                        getProportionateScreenHeight(60)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  widget.i.reference.delete();
                  Navigator.pop(context);
                },
                child: Text(
                  "Yes,  Remove",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
