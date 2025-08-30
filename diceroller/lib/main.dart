import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:diceroller/components/gradient_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: GradientContainer(Colors.amberAccent, Colors.green)),
    );
  }
}
