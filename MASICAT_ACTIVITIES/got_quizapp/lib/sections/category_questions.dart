import 'package:flutter/material.dart';
import 'package:got_quizapp/commons/styled_button.dart';
import 'package:got_quizapp/commons/styled_text.dart';
import 'package:got_quizapp/data/category_data.dart';
import 'package:got_quizapp/models/category_info.dart';

class CategoryQuestions extends StatefulWidget {
  const CategoryQuestions(
    this.selectedCategory, {
    super.key,
    required this.onItemAnswerSelection,
    required this.onCorrectAnswer,
  });

  final String selectedCategory;
  final void Function(String itemAnswers) onItemAnswerSelection;
  final VoidCallback onCorrectAnswer;

  @override
  State<CategoryQuestions> createState() {
    return _CategoryQuestionState();
  }
}

class _CategoryQuestionState extends State<CategoryQuestions> {
  var currentInfoIndex = 0;
  String? answerSelected;
  bool? isCorrect;
  List<String>? currentChoices;
  int totalCorrect = 0;

  void itemClick(String selectedAnswerItem, CategoryInfo currentInfo) {
    setState(() {
      answerSelected = selectedAnswerItem;
      isCorrect = selectedAnswerItem == currentInfo.correctAnswer;

      if (isCorrect!) {
        widget.onCorrectAnswer(); 
      }
    });

    widget.onItemAnswerSelection(selectedAnswerItem);

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          currentInfoIndex++;
          answerSelected = null;
          isCorrect = null;
          currentChoices = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    CategoryInfo currentInfo = HousesCategory[currentInfoIndex];

    if (widget.selectedCategory == "CHARACTERS") {
      currentInfo = CharactersCategory[currentInfoIndex];
    } else if (widget.selectedCategory == "SCENES") {
      currentInfo = ScenesCategory[currentInfoIndex];
    }
    currentChoices ??= currentInfo.getShuffledList();

    return Center(
      child: Container(
        margin: const EdgeInsets.all(100),
        child: Column(
          spacing: 5,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyledText(currentInfo.infoDescription, 25, Colors.white),
            const SizedBox(height: 30),
            ...currentChoices!.map((item) {
              Color buttonColor = Colors.white;
              if (answerSelected != null) {
                if (item == currentInfo.correctAnswer) {
                  buttonColor = Colors.green;
                } else if (item == answerSelected &&
                    item != currentInfo.correctAnswer) {
                  buttonColor = Colors.red;
                }
              }
              return StyledButton(
                text: item,
                buttonListener: () {
                  if (answerSelected == null) {
                    itemClick(item, currentInfo);
                  }
                },
                color: buttonColor,
              );
            }),
          ],
        ),
      ),
    );
  }
}
