// import 'package:flutter/material.dart';

// class Land extends StatefulWidget {
//   const Land({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _LandState createState() => _LandState();
// }

// class _LandState extends State<Land> {
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.2,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Image.asset("lib/images/logo/logo.png"),
//             SizedBox(
//               width: 500,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   TextButton(
//                     style: TextButton.styleFrom(primary: Colors.black),
//                     onPressed: () {},
//                     child: const Text(
//                       "ALL PRODUCTS",
//                       style:
//                           TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
//                     ),
//                   ),
//                   TextButton(
//                     style: TextButton.styleFrom(primary: Colors.black),
//                     onPressed: () {},
//                     child: const Text(
//                       "ABOUT",
//                       style:
//                           TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
//                     ),
//                   ),
//                   TextButton(
//                     style: TextButton.styleFrom(primary: Colors.black),
//                     onHover: (val) {},
//                     onPressed: () {},
//                     child: const Text(
//                       "SUPPORT",
//                       style:
//                           TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//                 width: 200,
//                 child: Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.search,
//                         size: 35,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     IconButton(
//                         onPressed: () {},
//                         icon: const Icon(
//                           Icons.shopping_cart,
//                           size: 35,
//                         )),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.account_circle,
//                         size: 35,
//                       ),
//                     ),
//                   ],
//                 )),
//           ],
//         ),
//         backgroundColor: Colors.white,
//         iconTheme: const IconThemeData(color: Colors.black),
//         foregroundColor: Colors.black, //
//       ),
//       body: SizedBox(
//         height: height * 50,
//         child: SingleChildScrollView(
//           child: Container(
//             color: const Color(0xFFF8F9FA),
//             height: height * 4,
//             width: width,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 const Caro(),
//                 Container(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       const Text(
//                         "Shop our latest offers and categories",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 50,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       const Text(
//                         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Scelerisque in est dui, aliquam, tempor.",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontWeight: FontWeight.w400),
//                       ),
//                       const Text(
//                         "Faucibus morbi turpis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontWeight: FontWeight.w400),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: height / 1.1,
//                   width: width / 1.2,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           InkWell(
//                             onTap: () {},
//                             //STACK WIDGET
//                             child: Stack(
//                               children: [
//                                 Container(
//                                   height: height / 2,
//                                   width: width / 2.5,
//                                   padding: const EdgeInsets.only(left: 300),
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(20)),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       SizedBox(
//                                         height: height / 4,
//                                       ),
//                                       const Text(
//                                         "Laptops",
//                                         style: TextStyle(
//                                             fontSize: 20, color: Colors.grey),
//                                       ),
//                                       const Text(
//                                         "True Laptop\n Solution",
//                                         style: TextStyle(
//                                             fontSize: 35,
//                                             fontWeight: FontWeight.w900),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Positioned(
//                                   left: 3,
//                                   bottom: 50,
//                                   child: Image.asset(
//                                     "lib/images/land/mid/pg1.png",
//                                     scale: 3,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           InkWell(
//                             onTap: () {},
//                             //STACK WIDGET
//                             child: Stack(
//                               children: [
//                                 Container(
//                                   height: height / 4,
//                                   width: width / 2.5,
//                                   padding: const EdgeInsets.only(left: 300),
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(20)),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       SizedBox(
//                                         height: height / 30,
//                                       ),
//                                       const Text(
//                                         "Watch",
//                                         style: TextStyle(
//                                             fontSize: 20, color: Colors.grey),
//                                       ),
//                                       const Text(
//                                         "Not Just\n Stylisht",
//                                         style: TextStyle(
//                                             fontSize: 35,
//                                             fontWeight: FontWeight.w900),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Positioned(
//                                   left: 30,
//                                   child: Image.asset(
//                                     "lib/images/land/mid/pg4.png",
//                                     scale: 3,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height / 1.3,
//                         width: width / 2.4,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             InkWell(
//                               onTap: () {},
//                               //STACK WIDGET
//                               child: Stack(
//                                 children: [
//                                   Container(
//                                     height: height / 1.1,
//                                     width: width / 5,
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius:
//                                             BorderRadius.circular(20)),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         SizedBox(
//                                           height: height / 2,
//                                         ),
//                                         const Text(
//                                           "Phones",
//                                           style: TextStyle(
//                                               fontSize: 20, color: Colors.grey),
//                                         ),
//                                         const Text(
//                                           "Your day to\n day life",
//                                           style: TextStyle(
//                                               fontSize: 35,
//                                               fontWeight: FontWeight.w900),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   Positioned(
//                                     top: 40,
//                                     left: 57,
//                                     child: Image.asset(
//                                       "lib/images/land/mid/pg2.png",
//                                       scale: 4,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () {},
//                               //STACK WIDGET
//                               child: Stack(
//                                 children: [
//                                   Container(
//                                     height: height / 1.1,
//                                     width: width / 5,
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius:
//                                             BorderRadius.circular(20)),
//                                     child: Column(
//                                       children: [
//                                         SizedBox(
//                                           height: height / 15,
//                                         ),
//                                         const Text(
//                                           "Tablet",
//                                           style: TextStyle(
//                                               fontSize: 20, color: Colors.grey),
//                                         ),
//                                         const Text(
//                                           "Empower\n your work",
//                                           style: TextStyle(
//                                               fontSize: 35,
//                                               fontWeight: FontWeight.w900),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   Positioned(
//                                     top: 200,
//                                     right: 5,
//                                     child: Image.asset(
//                                       "lib/images/land/mid/pg3.png",
//                                       scale: 5,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     const Text(
//                       "Save on our most selled items.",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 50,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     SizedBox(height: height / 30),
//                     const Text(
//                         "Our new Limited Edition Winter Design BESPOKE 4-Door Flex™"),
//                   ],
//                 ),
//                 SizedBox(
//                   height: height / 1.5,
//                   width: width,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       SizedBox(
//                         height: height / 1.5,
//                         width: width / 5,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               color: Colors.white,
//                               height: height / 3,
//                               width: width / 5,
//                               child:
//                                   Image.asset("lib/images/land/items/pg1.png"),
//                             ),
//                             const Text(
//                               "MacBook Pro 13",
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.w700),
//                             ),
//                             const Text(
//                               "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet",
//                               textAlign: TextAlign.justify,
//                             ),
//                             const Text(
//                               "\$ 1,200.00 USD",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w700, fontSize: 20),
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: height / 1.5,
//                         width: width / 5,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               color: Colors.white,
//                               height: height / 3,
//                               width: width / 5,
//                               child:
//                                   Image.asset("lib/images/land/items/pg2.png"),
//                             ),
//                             const Text(
//                               "Smart Galaxy Watch 3",
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.w700),
//                             ),
//                             const Text(
//                               "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
//                               textAlign: TextAlign.justify,
//                             ),
//                             const Text(
//                               "\$ 199.00 USD",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w700, fontSize: 20),
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: height / 1.5,
//                         width: width / 5,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               color: Colors.white,
//                               height: height / 3,
//                               width: width / 5,
//                               child:
//                                   Image.asset("lib/images/land/items/pg3.png"),
//                             ),
//                             const Text(
//                               "MacBook Air M1",
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.w700),
//                             ),
//                             const Text(
//                               "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
//                               textAlign: TextAlign.justify,
//                             ),
//                             const Text(
//                               "\$ 1,009.00 USD",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w700, fontSize: 20),
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: height / 1.5,
//                         width: width / 5,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               color: Colors.white,
//                               height: height / 3,
//                               width: width / 5,
//                               child:
//                                   Image.asset("lib/images/land/items/pg4.png"),
//                             ),
//                             const Text(
//                               "iPad",
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.w700),
//                             ),
//                             const Text(
//                               "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
//                               textAlign: TextAlign.justify,
//                             ),
//                             const Text(
//                               "\$ 1,200.00 USD",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w700, fontSize: 20),
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: height / 1.1,
//                   width: width,
//                   color: Colors.white,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Column(
//                         children: [
//                           const Text(
//                             "See the best around here",
//                             style: TextStyle(
//                                 fontSize: 45, fontWeight: FontWeight.w600),
//                           ),
//                           SizedBox(
//                             height: height / 70,
//                           ),
//                           Text(
//                               "Our new Limited Edition Winter Design BESPOKE 4-Door Flex™ "),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Container(
//                             height: height / 1.5,
//                             width: width / 4,
//                             decoration: BoxDecoration(
//                                 color: const Color(0xFFF8F9FA),
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Column(
//                               children: [
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Text("smart Light  bulb pack"),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                   "Latest and gratest",
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 SizedBox(
//                                   height: 60,
//                                 ),
//                                 SizedBox(
//                                   height: height / 13,
//                                   width: width / 8,
//                                   child: OutlinedButton(
//                                       style: ButtonStyle(
//                                           side: MaterialStateProperty.all(
//                                               const BorderSide(
//                                                   color: Colors.black)),
//                                           shape: MaterialStateProperty.all(
//                                               RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           30)))),
//                                       onPressed: () {},
//                                       child: const Text(
//                                         "Explore",
//                                         style: const TextStyle(
//                                             color: Colors.black),
//                                       )),
//                                 ),
//                                 Spacer(
//                                   flex: 2,
//                                 ),
//                                 Image.asset(
//                                   "lib/images/land/last/pg1.png",
//                                   scale: 2,
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             height: height / 1.5,
//                             width: width / 4,
//                             decoration: BoxDecoration(
//                                 color: const Color(0xFFF8F9FA),
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Column(
//                               children: [
//                                 SizedBox(
//                                   height: 19,
//                                 ),
//                                 Text("smart Light  bulb pack"),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                   "Best selling",
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 SizedBox(
//                                   height: 50,
//                                 ),
//                                 SizedBox(
//                                   height: height / 13,
//                                   width: width / 8,
//                                   child: OutlinedButton(
//                                       style: ButtonStyle(
//                                           side: MaterialStateProperty.all(
//                                               const BorderSide(
//                                                   color: Colors.black)),
//                                           shape: MaterialStateProperty.all(
//                                               RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           30)))),
//                                       onPressed: () {},
//                                       child: const Text(
//                                         "Explore",
//                                         style: const TextStyle(
//                                             color: Colors.black),
//                                       )),
//                                 ),
//                                 Spacer(
//                                   flex: 2,
//                                 ),
//                                 Image.asset(
//                                   "lib/images/land/last/pg2.png",
//                                   scale: 2,
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             height: height / 1.5,
//                             width: width / 4,
//                             decoration: BoxDecoration(
//                                 color: const Color(0xFFF8F9FA),
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Column(
//                               children: [
//                                 SizedBox(
//                                   height: 19,
//                                 ),
//                                 Text("smart Light  bulb pack"),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                   "Every Products",
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 SizedBox(
//                                   height: 50,
//                                 ),
//                                 SizedBox(
//                                   height: height / 13,
//                                   width: width / 8,
//                                   child: OutlinedButton(
//                                       style: ButtonStyle(
//                                           side: MaterialStateProperty.all(
//                                               const BorderSide(
//                                                   color: Colors.black)),
//                                           shape: MaterialStateProperty.all(
//                                               RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           30)))),
//                                       onPressed: () {},
//                                       child: const Text(
//                                         "Explore",
//                                         style: const TextStyle(
//                                             color: Colors.black),
//                                       )),
//                                 ),
//                                 Spacer(
//                                   flex: 3,
//                                 ),
//                                 Image.asset(
//                                   "lib/images/land/last/pg3.png",
//                                   scale: 2,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
