import 'package:flutter/material.dart';
import 'package:profile_activity/components/styled_text.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer(this.switchScreen, {super.key});

  final void Function() switchScreen;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 1,
            child: Image.asset(
              'assets/images/drogon.png',
              width: 400,
            ),
          ),
          StyledText('DROGON', 28, Colors.white),
          OutlinedButton.icon(
            onPressed: switchScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color.fromARGB(255, 154, 102, 102),
            ),
            icon: Icon(Icons.arrow_right_alt),
            label: StyledText('Start', 20, Colors.white),
          ),
        ],
      ),
    );
  }
}
