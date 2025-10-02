import 'package:expense_tracker_app/expense/expense_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 143, 202, 202),
          foregroundColor: Colors.white,
          elevation: 4.0,
          centerTitle: true,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: ExpenseScreen(),
    ),
  );
}
