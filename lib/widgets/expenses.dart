import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';

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
      title: "This is an expense card",
      amount: 10.00,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: "Swipe to remove",
      amount: 15,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
        title: "Try swiping in the opposite direction",
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

  void _dismissExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    // Clear any existing pop-ups before displaying a new one.
    ScaffoldMessenger.of(context).clearSnackBars();
    // Display a new pop-up message.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text(
          "Expense dismissed!",
        ),
        action: SnackBarAction(label: "Undo", onPressed: () {
          setState(() {
            // Re-insert the expense at the same location/index in the list.
            _registeredExpenses.insert(expenseIndex, expense);
          });
        },),
      ),
    );
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
          Chart(expenses: _registeredExpenses),
          Expanded(
              child: _registeredExpenses.isEmpty
                  ? const Center(
                      child: Text(
                        "No expenses found!",
                      ),
                    )
                  : ExpensesList(
                      expenses: _registeredExpenses,
                      onDismissExpense: _dismissExpense,
                    )),
        ],
      ),
    ));
  }
}

// Inside a class that extends State <>, a context property is
// made available by Flutter.
// Context contains information on relation about widget meta data and its relation
// to other widgets in the overall widget tree.
