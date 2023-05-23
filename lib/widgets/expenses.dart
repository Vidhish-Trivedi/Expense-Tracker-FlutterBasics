import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';

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

  void _displayAddExpenseModal() {
    // Used to display a modal on clicking the + button.
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return (NewExpense(_addExpense));
      },
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _displayAddExpenseModal,
            icon: const Icon(Icons.add),
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

// Inside a class that extends State <>, a context property is
// made available by Flutter.
// Context contains information on relation about widget meta data and its relation
// to other widgets in the overall widget tree.
