import 'package:flutter/material.dart';
import 'package:profile_activity/components/styled_button.dart';
import 'package:profile_activity/components/styled_text.dart';
import 'package:profile_activity/data/profile_data.dart';
import 'package:profile_activity/models/profile_info.dart' show ProfileInfo;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  var currentInfoIndex = 0;
  void itemClick() {
    setState(() {
      currentInfoIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    ProfileInfo currentInfo = profileData[currentInfoIndex];

    return Center(
      child: Container(
        margin: EdgeInsets.all(100),
        child: Column(
          spacing: 15,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyledText(currentInfo.infoDescription, 30, Colors.white),
            SizedBox(
              height: 30,
            ),
            ...currentInfo.getShuffledList().map((item) {
              return StyledButton(text: item, buttonListener: itemClick);
            }),
          ],
        ),
      ),
    );
  }
}
