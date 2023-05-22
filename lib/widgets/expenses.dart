import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

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
      title: "First1",
      amount: 10.00,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: "Second2",
      amount: 15,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
        title: "Third3",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.travel),
  ];

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text("Chart Here..."),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    ));
  }
}
