import 'package:ecom_app/nav/items/model.dart';
import 'package:ecom_app/nav/items/place.dart';
import 'package:ecom_app/utils/helpers.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static String id = "Home";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Welcome, Seyi",
            style: TextStyle(fontSize: 15),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: const AssetImage("lib/images/logo/log.png"),
            ),
            const SizedBox(
              width: 10,
            )
          ],
          actionsIconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: height * 1.8,
            width: width,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 2),
                  height: height / 4,
                  width: width / 1.1,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: const [
                              Text(
                                "iPhone X",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                              SizedBox(
                                height: 19,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 13.0),
                                child: Text(
                                  "Get the best of\n apple's product ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Image.asset(
                            "lib/images/land/plaq/pg1.png",
                            scale: 10,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Cardd(
                        image: "lib/images/land/cate/laptop.png",
                        name: "Laptop",
                      ),
                      Cardd(
                        image: "lib/images/land/cate/watch.png",
                        name: "Watch",
                      ),
                      Cardd(
                          image: "lib/images/land/cate/phone.png",
                          name: "phone"),
                      Cardd(
                        image: "lib/images/land/cate/earbuds.png",
                        name: "Earbuds",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 23,
                ),
                SizedBox(
                  height: height * 1.3,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: list.length,
                        padding: const EdgeInsets.all(8),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 10,
                                childAspectRatio: 0.75,
                                mainAxisSpacing: 10,
                                crossAxisCount: 2),
                        itemBuilder: (_, i) => Place(i)),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class Cardd extends StatefulWidget {
  final String image, name;

  const Cardd({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  State<Cardd> createState() => _CarddState();
}

class _CarddState extends State<Cardd> {
  SizeConfig size = SizeConfig();

  @override
  Widget build(BuildContext context) {
    size.init(context);
    return Container(
      height: getProportionateScreenHeight(90),
      width: getProportionateScreenWidth(80),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0, 0),
                blurRadius: 10,
                spreadRadius: 0)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            widget.image,
            scale: 15,
          ),
          Text(widget.name)
        ],
      ),
    );
  }
}
