import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

// Defining a color scheme. (Global variable naming convention: starts with 'k').
var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 100, 59, 150));

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer, // may be overridden.
            fontSize: 22,
          ),
        ),
      ),
      home: const Expenses(),
    ),
  );
}
