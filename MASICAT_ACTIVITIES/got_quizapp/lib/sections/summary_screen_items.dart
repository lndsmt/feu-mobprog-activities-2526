import 'package:flutter/material.dart';
import 'package:got_quizapp/commons/styled_text.dart';

class SummaryScreenItems extends StatelessWidget {
  const SummaryScreenItems(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Container(
              margin: const EdgeInsets.symmetric(
                vertical: 8,
              ), // spacing between rows
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Index number with fixed width for alignment
                  SizedBox(
                    width: 30,
                    child: StyledText(
                      (data['info-index']).toString(),
                      18,
                      Colors.amber,
                    ),
                  ),

                  const SizedBox(width: 10), // spacing between number & text
                  // Question + Answer
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledText(
                          (data['info-description']).toString(),
                          16,
                          Colors.white,
                        ),
                        const SizedBox(height: 5),
                        StyledText(
                          "Answer: ${(data['selected-info-item']).toString()}",
                          14,
                          Colors.grey.shade300,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
