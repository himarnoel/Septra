import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  final bool isActive;
  const SlideDots(this.isActive);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOutCubic,
      duration: const Duration(
        milliseconds: 1000,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 6 : 6,
      width: isActive ? 50 : 20,
      decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
