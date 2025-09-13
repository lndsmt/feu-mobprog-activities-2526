import 'package:flutter/material.dart';
import 'dart:math';

class DiceContainer extends StatefulWidget {
  DiceContainer({super.key});

  @override
  State<StatefulWidget> createState() => _DiceContainerState();
}

class _DiceContainerState extends State<DiceContainer> {
  var currentDice = 1;

  void rollDice() {
    setState(() {
      currentDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/$currentDice.png',
            width: 500,
          ),
          const SizedBox(height: 30),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 28,
              ),
            ),
            onPressed: rollDice,
            child: const Text('Roll Dice'),
          ),
        ],
      ),
    );
  }
}
