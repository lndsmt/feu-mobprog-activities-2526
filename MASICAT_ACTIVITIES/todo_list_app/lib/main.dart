import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_list_app/screens/todo_screen.dart';

Color defaultColor = Colors.lightBlue;
var myColorScheme = ColorScheme.fromSeed(
  seedColor: defaultColor,
);
var myDarkColorScheme = ColorScheme.fromSeed(
  seedColor: defaultColor,
  brightness: Brightness.dark,
);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: myDarkColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: myDarkColorScheme.onPrimaryContainer,
          foregroundColor: myDarkColorScheme.primaryContainer,
        ),
        cardTheme: CardThemeData().copyWith(
          color: myDarkColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: myDarkColorScheme.primaryContainer,
            foregroundColor: myDarkColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: myDarkColorScheme.onSecondaryContainer,
            fontSize: 20,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: myColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: myColorScheme.onPrimaryContainer,
          foregroundColor: myColorScheme.primaryContainer,
        ),
        cardTheme: CardThemeData().copyWith(
          color: myColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: myColorScheme.primaryContainer,
            foregroundColor: myColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: myColorScheme.onSecondaryContainer,
            fontSize: 20,
          ),
        ),
      ),
      themeMode: ThemeMode.light,
      home: TodoScreen(),
    ),
  );
}
