import 'package:flutter/material.dart';
import 'package:got_quizapp/commons/styled_text.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({
    super.key,
    required this.text,
    required this.buttonListener,
    this.color = Colors.white,
  });

  final void Function() buttonListener;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonListener,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        side: BorderSide(width: 2.0, color: Color.fromARGB(255, 121, 132, 143)),

        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
      ),
      child: StyledText(text, 20, Colors.blueGrey),
    );
  }
}
