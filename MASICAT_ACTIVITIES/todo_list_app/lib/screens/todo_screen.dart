import 'package:flutter/material.dart';
import 'package:todo_list_app/chart/chart.dart';
import 'package:todo_list_app/model/todo.dart';
import 'package:todo_list_app/screens/new_todo.dart';
import 'package:todo_list_app/screens/todo_list.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});
  @override
  State<TodoScreen> createState() {
    return _TodoScreenState();
  }
}

class _TodoScreenState extends State<TodoScreen> {
  final List<TodoItem> enteredTodos = [
    TodoItem(
      text: 'ITC1111 - Progress Report',
      date: DateTime.now(),
      category: Category.school,
      isDone: false,
    ),
    TodoItem(
      text: 'Journal',
      date: DateTime.now(),
      category: Category.personal,
      isDone: false,
    ),
  ];
  void openExpenseModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewTodo(
        addToDo: addToDo,
      ),
    );
  }

  final Map<Category, int> doneItemCount = {
    Category.school: 0,
    Category.home: 0,
    Category.work: 0,
    Category.personal: 0,
  };

  void addToDo(TodoItem todo) {
    setState(() {
      enteredTodos.add(todo);
    });
  }

  void removeTodo(TodoItem todo) {
    final todoIndex = enteredTodos.indexOf(todo);
    setState(() {
      enteredTodos.remove(todo);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text(
          'Todo deleted',
        ),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              enteredTodos.insert(todoIndex, todo);
            });
          },
        ),
      ),
    );
  }

  void markAsDone(TodoItem todo) {
    final todoIndex = enteredTodos.indexOf(todo);
    if (todo.isDone) return;

    setState(() {
      todo.isDone = true;

      doneItemCount[todo.category] = (doneItemCount[todo.category] ?? 0) + 1;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text(
          'Todo done',
        ),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              enteredTodos.insert(todoIndex, todo);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    Widget mainContent = Center(
      child: Text(
        'No expenses found. Try adding one!',
      ),
    );

    if (enteredTodos.isNotEmpty) {
      mainContent = TodoList(
        todoItem: enteredTodos,
        removeTodo: removeTodo,
        markAsDone: markAsDone,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        actions: [
          IconButton(
            onPressed: openExpenseModal,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: screenWidth < 600
          ? Column(
              children: [
                Chart(enteredTodos: enteredTodos),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(enteredTodos: enteredTodos)),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
