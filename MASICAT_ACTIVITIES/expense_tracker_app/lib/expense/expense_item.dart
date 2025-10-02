import 'package:expense_tracker_app/commons/styled_text.dart';
import 'package:expense_tracker_app/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 143, 202, 202),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          spacing: 5,
          children: [
            StyledText(
              expense.title,
              GoogleFonts.righteous(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                StyledText(
                  '\$${expense.amount.toStringAsFixed(2)}',
                  GoogleFonts.sofiaSans(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Row(
                  spacing: 5,
                  children: [
                    Icon(
                      categoryIcons[expense.category],
                      color: Colors.white,
                    ),
                    StyledText(
                      expense.formattedDate,
                      GoogleFonts.sofiaSans(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
