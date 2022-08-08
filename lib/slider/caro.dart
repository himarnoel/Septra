
import 'package:flutter/material.dart';

import 'dart:async';

import '../component/btn.dart';
import '../pages/land.dart';
import 'dot.dart';
import 'item.dart';
import 'slide.dart';

class Caoursel extends StatefulWidget {
  static String id = "Caro";

  const Caoursel({Key? key}) : super(key: key);
  @override
  _CaourselState createState() => _CaourselState();
}

class _CaourselState extends State<Caoursel> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(_currentPage,
          duration: Duration(
            milliseconds: 3000,
          ),
          curve: Curves.easeIn);
    });
  }

  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChaged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    double text = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Expanded(
                child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                PageView.builder(
                  onPageChanged: _onPageChaged,
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemCount: slideList.length,
                  itemBuilder: (ctx, i) => SliderItem(i),
                ),
              ],
            )),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 35),
                    child: Row(
                      //ainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < slideList.length; i++)
                          if (i == _currentPage)
                            SlideDots(true)
                          else
                            SlideDots(false)
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Buttonn(
                        texp: "Next",
                        height: height / 12,
                        width: width / 1.1,
                        text: text * 20,
                        onPressed: () {
                          Navigator.pushNamed(context, Land.id);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
