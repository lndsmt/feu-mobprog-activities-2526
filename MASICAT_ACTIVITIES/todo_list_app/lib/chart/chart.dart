import 'package:flutter/material.dart';
import 'package:todo_list_app/chart/chart_bar.dart';
import 'package:todo_list_app/model/todo.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.enteredTodos,
  });

  final List<TodoItem> enteredTodos;

  List<TodoBucket> get buckets {
    return [
      TodoBucket.forCategory(enteredTodos, Category.home),
      TodoBucket.forCategory(enteredTodos, Category.personal),
      TodoBucket.forCategory(enteredTodos, Category.work),
      TodoBucket.forCategory(enteredTodos, Category.school),
    ];
  }

  int get _totalCount {
    int totalCount = 0;
    for (final bucket in buckets) {
      if (bucket.totalToDos > totalCount) {
        totalCount = bucket.totalToDos;
      }
    }
    return totalCount;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    final totalCount = _totalCount;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.5),
            Theme.of(context).colorScheme.primary.withOpacity(0.0),
          ],
          begin: AlignmentGeometry.bottomCenter,
          end: AlignmentGeometry.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets)
                  ChartBar(
                    fill: bucket.totalToDos == 0
                        ? 0
                        : bucket.totalToDos / totalCount,
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: buckets
                .map(
                  (buckets) => Expanded(
                    child: Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: 4,
                      ),
                      child: Icon(
                        categoryIcons[buckets.category],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(
                                context,
                              ).colorScheme.primary.withOpacity(0.7),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
