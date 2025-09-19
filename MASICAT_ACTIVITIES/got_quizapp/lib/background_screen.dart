import 'package:flutter/material.dart';
import 'package:got_quizapp/data/category_data.dart';
import 'package:got_quizapp/sections/category_questions.dart';
import 'package:got_quizapp/sections/summary_screen.dart';
import 'package:got_quizapp/title_screen.dart';
import 'package:got_quizapp/sections/category_section.dart';

class BackgroundScreen extends StatefulWidget {
  const BackgroundScreen({super.key});
  @override
  State<BackgroundScreen> createState() {
    return _BackgroundScreenState();
  }
}

class _BackgroundScreenState extends State<BackgroundScreen> {
  final List<String> selectedAnswers = [];
  String selectedCategory = '';
  var activeScreen = 'title-screen';
  int totalCorrect = 0;

  void switchScreen() {
    setState(() {
      selectedAnswers.clear();
      totalCorrect = 0;
      activeScreen = "category-section";
    });
  }

  void switchToHomeScreen() {
    setState(() {
      selectedAnswers.clear();
      totalCorrect = 0;
      activeScreen = "title-screen";
    });
  }

  void switchCategoryQuestionScreen() {
    setState(() {
      selectedAnswers.clear();
      totalCorrect = 0;
      activeScreen = "question-section";
    });
  }

  void addSelectedCategory(String selectedItem) {
    selectedCategory = selectedItem;
  }

  void addSelectedAnswers(String itemAnswers) {
    selectedAnswers.add(itemAnswers);

    if (selectedCategory == 'HOUSES') {
      if (selectedAnswers.length >= HousesCategory.length) {
        setState(() {
          activeScreen = "summary-screen";
        });
      }
    } else if (selectedCategory == 'CHARACTERS') {
      if (selectedAnswers.length >= CharactersCategory.length) {
        setState(() {
          activeScreen = "summary-screen";
        });
      }
    } else if (selectedCategory == 'SCENES') {
      if (selectedAnswers.length >= ScenesCategory.length) {
        setState(() {
          activeScreen = "summary-screen";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = TitleScreen(switchScreen);

    if (activeScreen == 'category-section') {
      currentScreen = CategorySection(
        switchCategoryQuestionScreen,
        onCategoryItemSelection: addSelectedCategory,
      );
    } else if (activeScreen == 'question-section') {
      currentScreen = CategoryQuestions(
        selectedCategory,
        onItemAnswerSelection: addSelectedAnswers,
        onCorrectAnswer: () {
          setState(() {
            totalCorrect++;
          });
        },
      );
    } else if (activeScreen == 'summary-screen') {
      currentScreen = SummaryScreen(
        selectedCategory,
        selectedAnswers: selectedAnswers,
        totalCorrect: totalCorrect,
        retakeQuiz: switchCategoryQuestionScreen,
        retakeProfile: switchScreen,
        goToHome: switchToHomeScreen,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 107, 116, 135),
                const Color.fromARGB(255, 0, 0, 0),
              ],
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
