import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(
    this.text,
    this.fontStyle, {
    super.key,
  });

  final String text;
  final TextStyle? fontStyle;

  @override
  Widget build(context) {
    return Text(
      text,
      style: fontStyle,
    );
  }
}
