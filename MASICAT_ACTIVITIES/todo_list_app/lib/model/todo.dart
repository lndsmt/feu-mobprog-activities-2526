import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

final dateFormatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {
  school,
  home,
  work,
  personal,
}

const categoryIcons = {
  Category.school: Icons.school,
  Category.home: Icons.home,
  Category.work: Icons.work,
  Category.personal: Icons.person,
};

class TodoItem {
  TodoItem({
    required this.text,
    required this.date,
    required this.category,
    this.isDone = false,
  }) : id = uuid.v4();

  final String id;
  final String text;
  final DateTime date;
  final Category category;
  bool isDone;

  String get formattedDate {
    return dateFormatter.format(date);
  }
}

class TodoBucket {
  const TodoBucket({
    required this.category,
    required this.todos,
  });

  TodoBucket.forCategory(List<TodoItem> allToDo, this.category)
    : todos = allToDo.where((todo) => todo.category == category).toList();

  final Category category;
  final List<TodoItem> todos;

  int get totalToDos {
    int sum = todos.length;

    return sum;
  }
}
