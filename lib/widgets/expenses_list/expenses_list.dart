import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onDismissExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onDismissExpense;

  @override
  Widget build(BuildContext context) {
    return (ListView.builder(
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(expenses[index]),
          // Dismissible list items/widgets need a unique key identifiers.
          onDismissed: (direction) => onDismissExpense(expenses[index]),
          child: (ExpenseItem(expenses[index])),
        );
      },
      itemCount: expenses.length,
    ));
  }
}

// ListView is useful when final length of list is unknown.
// List elements are created efficiently using ListView, unlike Column, which creates all of them at once.
// If we set its children: attribute, it sets up a scrollable list in a similar manner as Column.
// Instead, we can use its .builder() constructor.
