import 'package:flutter/material.dart';
import 'package:todo_list_app/model/todo.dart';
import 'package:todo_list_app/screens/todo_items.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.todoItem,
    required this.removeTodo,
    required this.markAsDone,
  });

  final List<TodoItem> todoItem;
  final void Function(TodoItem todo) removeTodo;
  final void Function(TodoItem todo) markAsDone;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoItem.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(todoItem[index].id),
        direction: DismissDirection.horizontal,
        background: Container(
          color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.2),
          margin: Theme.of(context).cardTheme.margin,
          child: Icon(Icons.check),
        ),
        secondaryBackground: Container(
          color: Theme.of(
            context,
          ).colorScheme.onErrorContainer.withOpacity(0.2),
          margin: Theme.of(context).cardTheme.margin,
          child: Icon(Icons.delete_outline),
        ),

        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            markAsDone(todoItem[index]);
            return false;
          }
          return true;
        },
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            removeTodo(todoItem[index]);
          }
        },
        child: TodoItems(
          todoItem[index],
        ),
      ),
    );
  }
}
