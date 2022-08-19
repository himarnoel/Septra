import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/helpers.dart';

class Checkout extends StatefulWidget {
  static String id = "checkout";
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  CollectionReference users = FirebaseFirestore.instance.collection('Cart');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Checkout"),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewportConstraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Shipping Address",
                  style: TextStyle(fontSize: 17),
                ),
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text("Home"),
                    subtitle: Text("6140 sunbrook Park Pc 5667"),
                    trailing:
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  ),
                ),
                const Text(
                  "Order List",
                  style: TextStyle(fontSize: 17),
                ),
                FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('Cart')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection('cart')
                        .get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Something went wrong");
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        final data = snapshot.data!.docs;
                        return Container(
                          height: getProportionateScreenHeight(500),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: data.length,
                              itemBuilder: (context, i) {
                                return OrderCard(
                                    image: data[i]['image'],
                                    name: data[i]['name'],
                                    price: data[i]['price'].toString(),
                                    quantity: data[i]['Quantity'].toString());
                              }),
                        );
                      }

                      return Text("loading");
                    })
              ],
            ),
          ),
        ));
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        color: Colors.white,
        child: Row(
          children: [
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Cart')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('cart')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  var price = 0;
                  snapshot.data?.docs.forEach((e) {
                    price += e.get('price') as int;
                  });
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Expanded(
                    child: ListTile(
                      title: Text("Total Price"),
                      subtitle: Text(
                        "\$ ${price}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    minimumSize: Size(getProportionateScreenWidth(92),
                        getProportionateScreenHeight(60)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.pushNamed(context, Checkout.id);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Checkout",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatefulWidget {
  final String name;
  final String price;
  final String quantity;
  final String image;
  const OrderCard({
    Key? key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
  }) : super(key: key);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  SizeConfig sizeConfig = SizeConfig();
  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          height: getProportionateScreenHeight(120),
          width: getProportionateScreenWidth(320),
          padding: const EdgeInsets.only(
            left: 8,
          ),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 232, 230, 230).withOpacity(1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                height: getProportionateScreenHeight(100),
                width: getProportionateScreenWidth(100),
                child: Image.network(
                  widget.image,
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
                        width: getProportionateScreenWidth(20),
                        height: getProportionateScreenHeight(70),
                      ),
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: getProportionateScreenWidth(40),
                      ),
                      Text(
                        "\$ ${widget.price}",
                        style: const TextStyle(fontSize: 19),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(80),
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          height: getProportionateScreenHeight(30),
                          width: getProportionateScreenWidth(30),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black12,
                          ),
                          child: Center(
                            child: Text(
                              widget.quantity,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                          )),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
