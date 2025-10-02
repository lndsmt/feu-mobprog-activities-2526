import 'package:expense_tracker_app/commons/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/model/expense.dart';
import 'package:google_fonts/google_fonts.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addExpense});

  final void Function(Expense expense) addExpense;

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? dateSelected;
  Category selectedCategory = Category.food;

  void submitExpenseData() {
    double? enteredAmount = double.tryParse(amountController.text);

    if (titleController.text.trim().isEmpty ||
        enteredAmount == null ||
        enteredAmount <= 0 ||
        dateSelected == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: Color.fromARGB(255, 131, 187, 187),
          title: StyledText(
            'Invalid Data!',
            GoogleFonts.sofiaSans(
              color: Colors.white,
            ),
          ),
          content: StyledText(
            "Please fill out all fields with valid data.",
            GoogleFonts.sofiaSans(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: StyledText(
                "OK",
                GoogleFonts.oxanium(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      );
      return;
    }

    Expense newExpense = Expense(
      title: titleController.text.trim(),
      amount: enteredAmount,
      date: dateSelected!,
      category: selectedCategory,
    );

    widget.addExpense(newExpense);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Color.fromARGB(255, 131, 187, 187),
        title: StyledText(
          'Expense successfully saved',
          GoogleFonts.sofiaSans(
            color: Colors.white,
          ),
        ),
        content: StyledText(
          'Expense was saved with the following'
          '\nTitle: ${newExpense.title}'
          '\nAmount: \$${newExpense.amount}',
          GoogleFonts.sofiaSans(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: StyledText(
              'OK',
              GoogleFonts.oxanium(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
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
      lastDate: initialDate,
    );
    //...
    setState(() {
      dateSelected = datePicked;
    });

    return;
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: StyledText('Title', GoogleFonts.righteous()),
            ),
          ),
          Row(
            spacing: 16,
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: StyledText(
                      'Amount',
                      GoogleFonts.sofiaSans(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StyledText(
                      dateSelected == null
                          ? 'No Date Selected'
                          : formatter.format(dateSelected!),
                      GoogleFonts.sofiaSans(),
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
                            StyledText(
                              category.name.toString().toUpperCase(),
                              GoogleFonts.sofiaSans(),
                            ),
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
                child: StyledText(
                  'Cancel',
                  GoogleFonts.sofiaSans(
                    color: Color.fromARGB(255, 91, 122, 91),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: submitExpenseData,
                child: StyledText(
                  'Save Expense',
                  GoogleFonts.sofiaSans(
                    color: Color.fromARGB(255, 91, 122, 91),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
