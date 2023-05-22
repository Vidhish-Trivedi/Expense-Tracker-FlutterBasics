import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return (
      ListView.builder(
        itemBuilder: (context, index) {
          return(
            Text(expenses[index].title)
          );
        },
        itemCount: expenses.length,
      )
    );
  }
}

// ListView is useful when final length of list is unknown.
// List elements are created efficiently using ListView, unlike Column, which creates all of them at once.
// If we set its children: attribute, it sets up a scrollable list in a similar manner as Column.
// Instead, we can use its .builder() constructor.
