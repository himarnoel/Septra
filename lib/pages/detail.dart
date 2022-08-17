import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:septra/pages/Cart/addtoCart.dart';

import 'package:septra/utils/helpers.dart';

import 'Cart/cart.dart';

class Detail extends StatefulWidget {
  static String id = "detail";
  final String name;
  final int price;
  final String image;
  const Detail({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  var store = FirebaseFirestore.instance.collection('Cart');
  var length = 0;

  final AddtoCart _addtoCart = AddtoCart();
  int val = 1;
  SizeConfig sizeConfig = SizeConfig();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFF3F3F3),
        elevation: 0,
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Cart.id);
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    size: 30,
                  )),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Cart')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('cart')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 6.0, left: 30),
                      child: Container(
                          height: getProportionateScreenHeight(18),
                          width: getProportionateScreenWidth(18),
                          child: Center(
                            child: Text(
                              snapshot.data!.docs.length.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red.shade500)),
                    );
                  })
            ],
          ),
          const SizedBox(
            width: 20,
          )
        ],
        actionsIconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            height: getProportionateScreenHeight(400),
            width: getProportionateScreenWidth(900),
            decoration: const BoxDecoration(color: Color(0XFFF3F3F3)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  widget.image,
                  scale: 2.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(6),
                      width: getProportionateScreenWidth(50),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: getProportionateScreenHeight(6),
                      width: getProportionateScreenWidth(20),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade500,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: getProportionateScreenHeight(6),
                      width: getProportionateScreenWidth(20),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade500,
                          borderRadius: BorderRadius.circular(10)),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(310),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border)),
                    ],
                  ),
                  const ListTile(
                    title: Text("Description"),
                    subtitle: Text(
                        "Labore dolores dolor aliquyam sanctus sit. Et eirmod sadipscing amet sanctus eirmod sanctus, sit est eos ipsum at lorem gubergren,."),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Quatity",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                          height: getProportionateScreenHeight(44),
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              IconButton(
                                  iconSize: 18,
                                  splashRadius: 10,
                                  onPressed: () {
                                    val++;
                                    _addtoCart.updateQuantity(
                                        whatSign: true,
                                        name: widget.name,
                                        price: widget.price * val,
                                        quantity: val);
                                    setState(() {});

                                    //     val = widget.i["Quantity"];
                                    // val++;
                                    // var price = widget.i["price"] * val;
                                    // _addtoCart.updateQuantity(
                                    //     whatSign: true,
                                    //     name: widget.i["name"],
                                    //     price: price,
                                    //     quantity: val);
                                    // setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    size: 18,
                                  )),
                              Text(
                                val.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  splashRadius: 10,
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('Cart')
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.uid)
                                        .collection("cart")
                                        .doc(widget.name)
                                        .snapshots()
                                        .listen((event) {
                                      print(event);
                                    });

                                    // val--;
                                    // // updateQuatityDetail(quantity: val);
                                    // if (val <= 0) {
                                    //   val = 1;
                                    // }
                                    // _addtoCart.updateQuantity(
                                    //     whatSign: false,
                                    //     name: widget.name,
                                    //     price: widget.price,
                                    //     quantity: val);
                                    // setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 18,
                                  ))
                            ],
                          )),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: ListTile(
                          title: const Text(
                            "Total Price",
                            style: TextStyle(fontSize: 10),
                          ),
                          subtitle: Text(
                            "\$ ${widget.price.toString()}",
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              minimumSize: Size(getProportionateScreenWidth(92),
                                  getProportionateScreenHeight(60)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            _addtoCart.addtoCart(
                                context: context,
                                quantity: val,
                                name: widget.name,
                                image: widget.image,
                                price: widget.price);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Icons.add_shopping_cart_sharp,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Add to Cart",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
