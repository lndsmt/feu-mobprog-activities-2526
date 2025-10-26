import 'package:flutter/material.dart';
import 'package:todo_list_app/model/todo.dart';

class TodoItems extends StatelessWidget {
  const TodoItems(this.item, {super.key});

  final TodoItem item;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: item.isDone ? 0.5 : 1.0,
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(
                item.text,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                spacing: 5,
                children: [
                  Text(
                    item.formattedDate,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
