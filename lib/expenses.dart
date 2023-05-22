import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return (_ExpensesState());
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "First",
      amount: 10.00,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: "Second",
      amount: 15,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
        title: "Third",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.travel),
  ];

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Column(
        children: [
          const Text("Chart Here..."),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    ));
  }
}
