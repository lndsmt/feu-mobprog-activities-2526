import 'package:flutter/material.dart';
import 'package:got_quizapp/commons/styled_button.dart';
import 'package:got_quizapp/commons/styled_text.dart';
import 'package:got_quizapp/data/category_choices_data.dart';
import 'package:got_quizapp/models/category_choices_info.dart';

class CategorySection extends StatefulWidget {
  const CategorySection(
    this.switchCategoryScreen, {
    super.key,
    required this.onCategoryItemSelection,
  });

  final void Function() switchCategoryScreen;
  final void Function(String selectedItem) onCategoryItemSelection;

  @override
  State<CategorySection> createState() {
    return _CategorySectionState();
  }
}

class _CategorySectionState extends State<CategorySection> {
  var currentChoiceInfoIndex = 0;
  void itemClick(String selectedCategoryChoice) {
    widget.onCategoryItemSelection(selectedCategoryChoice);
    widget.switchCategoryScreen();
  }

  @override
  Widget build(BuildContext context) {
    CategoryChoicesInfo currentChoiceInfo =
        CategoryChoicesData[currentChoiceInfoIndex];

    return Center(
      child: Container(
        margin: EdgeInsets.all(100),
        child: Column(
          spacing: 5,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // StyledText(currentInfo.infoDescription, 30, Colors.white),
            StyledText(currentChoiceInfo.categoryDescription, 20, Colors.white),
            SizedBox(height: 30),
            ...currentChoiceInfo.getShuffledList().map((item) {
              return StyledButton(
                text: item,
                buttonListener: () {
                  itemClick(item);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
