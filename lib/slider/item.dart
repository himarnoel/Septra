import 'package:ecom_app/slider/slide.dart';
import 'package:flutter/material.dart';

class SliderItem extends StatelessWidget {
  final int index;
  const SliderItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Image.asset(slideList[index].imageUrl),
        Text(
          slideList[index].title,
          style: const TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
        ),
        Text(
          slideList[index].description,
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
