import 'package:flutter/material.dart';
import 'package:got_quizapp/commons/styled_button.dart';
import 'package:got_quizapp/commons/styled_text.dart';
import 'package:got_quizapp/data/category_data.dart';
import 'package:got_quizapp/sections/summary_screen_items.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen(
    this.selectedCategory, {
    super.key,
    required this.selectedAnswers,
    required this.totalCorrect,
    required this.retakeQuiz,
    required this.retakeProfile,
    required this.goToHome,
  });

  final void Function() retakeProfile;
  final void Function() retakeQuiz;
  final void Function() goToHome;
  final String selectedCategory;
  final List<String> selectedAnswers;
  final int totalCorrect;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    if (selectedCategory == 'HOUSES') {
      if (selectedAnswers.length >= HousesCategory.length) {
        for (var i = 0; i < selectedAnswers.length; i++) {
          summary.add({
            'info-index': i + 1,
            'info-description': HousesCategory[i].infoDescription,
            'selected-info-item': selectedAnswers[i],
          });
        }
      }
    } else if (selectedCategory == 'CHARACTERS') {
      if (selectedAnswers.length >= CharactersCategory.length) {
        for (var i = 0; i < selectedAnswers.length; i++) {
          summary.add({
            'info-index': i + 1,
            'info-description': CharactersCategory[i].infoDescription,
            'selected-info-item': selectedAnswers[i],
          });
        }
      }
    } else if (selectedCategory == 'SCENES') {
      if (selectedAnswers.length >= ScenesCategory.length) {
        for (var i = 0; i < selectedAnswers.length; i++) {
          summary.add({
            'info-index': i + 1,
            'info-description': ScenesCategory[i].infoDescription,
            'selected-info-item': selectedAnswers[i],
          });
        }
      }
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(50),
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledText("GAME OF THRONES QUIZ", 30, Colors.amberAccent),
            StyledText(
              "Score: $totalCorrect / ${selectedAnswers.length}",
              25,
              Colors.white,
            ),
            SummaryScreenItems(getSummaryData()),
            StyledButton(text: "Retake Quiz", buttonListener: retakeQuiz),
            StyledButton(
              text: "Retake Category",
              buttonListener: retakeProfile,
            ),
            StyledButton(text: "Home", buttonListener: goToHome),
          ],
        ),
      ),
    );
  }
}
