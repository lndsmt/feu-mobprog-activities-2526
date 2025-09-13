import 'package:flutter/material.dart';
import 'package:profile_activity/components/image_container.dart';
import 'package:profile_activity/profile/profile_screen.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({super.key});

  @override
  State<ProfileMain> createState() {
    return _ProfileMainState();
  }
}

class _ProfileMainState extends State<ProfileMain> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = ImageContainer(switchScreen);
  //   super.initState();
  // }

  // void switchScreen() {
  //   setState(() {
  //     activeScreen = const ProfileScreen();
  //   });
  // }

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = "profile-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = ImageContainer(switchScreen);

    if (activeScreen == 'profile-screen') {
      currentScreen = ProfileScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Colors.red,
              ],
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
