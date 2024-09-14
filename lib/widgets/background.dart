import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width,
      height: size.height,
      child: const Stack(
        children: [
          CoffeBean(degree: 190, right: 160, top: 90),
          CoffeBean(degree: 90, left: -50, top: 5),
          CoffeBean(degree: 10, left: -70, top: 140),
          CoffeBean(degree: 75, right: -20, top: 150),
          CoffeBean(degree: 100, right: -70, top: 300),
          CoffeBean(degree: 155, right: 70, top: 350),
        ],
      ),
    );
  }
}

class CoffeBean extends StatelessWidget {
  final double? top, left, right, bottom, degree;
  const CoffeBean(
      {super.key, this.bottom, this.top, this.left, this.right, this.degree});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        bottom: bottom,
        right: right,
        left: left,
        child: Transform.rotate(
            angle: degree! * pi / 190,
            child: SvgPicture.asset(
              'images/coffee-bean.svg',
              width: 150,
            )));
  }
}
