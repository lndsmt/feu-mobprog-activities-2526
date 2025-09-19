import 'package:flutter/material.dart';
import 'package:got_quizapp/commons/styled_text.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: 1,
                child: Image.asset(
                  'assets/images/TitleScreenImage.jpg',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              OutlinedButton.icon(
                onPressed: switchScreen,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 198, 210, 222),
                ),
                icon: Icon(Icons.arrow_right_alt),
                label: StyledText(
                  'START',
                  20,
                  const Color.fromARGB(255, 49, 61, 63),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
