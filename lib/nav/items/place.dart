import 'package:flutter/material.dart';

import 'package:septra/pages/detail.dart';

import '../../utils/helpers.dart';
import 'model.dart';

class Place extends StatelessWidget {
  SizeConfig size = SizeConfig();

  final int index;

  Place({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    size.init(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(
                name: list[index].name,
                price: list[index].price,
                image: list[index].image),
          ),
        );
      },
      child: Container(
        height: getProportionateScreenHeight(200),
        width: getProportionateScreenWidth(90),
        padding: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(0, 0),
                  blurRadius: 6,
                  spreadRadius: 0)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              list[index].image,
              scale: 8,
            ),
            Container(
              height: height / 8,
              width: width / 2,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      list[index].name,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "\$ ${list[index].price}",
                      style: TextStyle(color: Colors.white),
                    ),
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
