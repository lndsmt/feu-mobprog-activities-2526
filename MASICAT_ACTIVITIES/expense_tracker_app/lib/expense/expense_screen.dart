import 'package:expense_tracker_app/commons/styled_text.dart';
import 'package:expense_tracker_app/expense/expense_list.dart';
import 'package:expense_tracker_app/expense/new_expense.dart';
import 'package:expense_tracker_app/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() {
    return _ExpenseScreenState();
  }
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final List<Expense> registeredExpenses = [
    Expense(
      title: 'Lunch sa Jollibee',
      amount: 300.49,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Team Building',
      amount: 1000.49,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Demon Slayer Movie',
      amount: 450.49,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void openExpenseModal() {
    showModalBottomSheet(
      backgroundColor: Color.fromARGB(255, 204, 226, 203),
      context: context,
      builder: (ctx) => NewExpense(
        addExpense: addExpense,
      ),
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final expenseIndex = registeredExpenses.indexOf(expense);
    setState(() {
      registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(
      SnackBar(
        backgroundColor: Color.fromARGB(255, 126, 189, 189),
        duration: Duration(seconds: 3),
        content: StyledText(
          'Expense Deleted!',
          GoogleFonts.oxanium(),
        ),
        action: SnackBarAction(
          textColor: Colors.white,
          label: 'Undo',
          onPressed: () {
            setState(() {
              registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: StyledText(
        'No expenses found. Try adding one.',
        GoogleFonts.oxanium(
          fontSize: 15,
          color: Color.fromARGB(255, 79, 134, 134),
        ),
      ),
    );

    if (registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: registeredExpenses,
        removeExpense: removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: StyledText(
          'Lindsy\'s Expense Tracker',
          GoogleFonts.permanentMarker(
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: openExpenseModal,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 212, 240, 240),
              Color.fromARGB(255, 204, 226, 203),
              //const Color.fromARGB(255, 182, 207, 182),
            ],
          ),
        ),
        child: Column(
          children: [
            StyledText(
              'Chart Area',
              GoogleFonts.titanOne(
                color: Color.fromARGB(255, 79, 134, 134),
                fontSize: 20,
              ),
            ),
            Expanded(
              child: mainContent,
            ),
          ],
        ),
      ),
    );
  }
}
