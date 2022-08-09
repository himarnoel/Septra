import 'package:flutter/material.dart';

import 'package:septra/utils/helpers.dart';

import 'cartmodel.dart';

class CartCard extends StatefulWidget {
  final viewport;
  final int i;
  const CartCard({
    Key? key,
    this.viewport,
    required this.i,
  }) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  SizeConfig sizeConfig = SizeConfig();
  int val = 1;
  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 150,
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
                      child: Image.asset(
                        model[widget.i].image,
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
                            ),
                            Text(
                              model[widget.i].name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(40),
                            ),
                            IconButton(
                                onPressed: () {},
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
                              model[widget.i].price,
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
                                          val--;
                                          if (val <= 0) {
                                            val = 1;
                                          }
                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          size: 18,
                                        )),
                                    Text(
                                      val.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                        iconSize: 18,
                                        splashRadius: 10,
                                        onPressed: () {
                                          val++;
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
