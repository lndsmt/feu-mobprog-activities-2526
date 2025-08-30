import 'package:flutter/material.dart';
import 'package:diceroller/components/dice_container.dart';
// import 'package:flutter_app/text_container.dart';

class GradientContainer extends StatelessWidget {
  GradientContainer(this.color1, this.color2, {super.key});

  final dynamic? color1, color2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color1, color2], // Colors
        ),
      ),
      child: Center(child: DiceContainer()),
    );
  }
}
