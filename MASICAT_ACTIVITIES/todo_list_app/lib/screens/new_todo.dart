import 'package:flutter/material.dart';
import 'package:todo_list_app/model/todo.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({
    super.key,
    required this.addToDo,
  });

  final void Function(TodoItem todo) addToDo;

  @override
  State<StatefulWidget> createState() {
    return _NewTodoState();
  }
}

class _NewTodoState extends State<NewTodo> {
  final textController = TextEditingController();
  DateTime? dateSelected;
  Category selectedCategory = Category.personal;

  void submitTodoData() {
    if (textController.text.trim().isEmpty || dateSelected == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Invalid Data',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          content: Text('Please fill out all fields with valid data.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text(
                'OK',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      );
      return;
    }

    TodoItem newItem = TodoItem(
      text: textController.text.trim(),
      date: dateSelected!,
      category: selectedCategory,
    );

    widget.addToDo(newItem);
  }

  void openDatePicker() async {
    final initialDate = DateTime.now();
    final firstDate = DateTime(
      initialDate.year - 1,
      initialDate.month,
      initialDate.day,
    );

    final datePicked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: DateTime(9999),
    );

    setState(() {
      dateSelected = datePicked;
    });

    return;
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(16),
      child: Column(
        children: [
          TextField(
            style: Theme.of(context).textTheme.titleMedium,
            controller: textController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: Text(
                'Title',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          Row(
            spacing: 16,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      style: Theme.of(context).textTheme.titleMedium,
                      dateSelected == null
                          ? 'No Date Selected'
                          : dateFormatter.format(dateSelected!),
                    ),
                    IconButton(
                      onPressed: openDatePicker,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            spacing: 10,
            children: [
              DropdownButton(
                value: selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Row(
                          spacing: 10,
                          children: [
                            Icon(categoryIcons[category]),
                            Text(category.name.toString().toUpperCase()),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }

                  setState(() {
                    selectedCategory = value;
                  });
                },
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  submitTodoData();
                  Navigator.pop(context);
                },
                child: Text('Save ToDo'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
