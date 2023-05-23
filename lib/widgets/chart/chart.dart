import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  List <ExpenseBucket> get buckets {
    List <ExpenseBucket> expenseBuckets = [];
    for(final c in Category.values) {
      expenseBuckets.add(ExpenseBucket.forCategory(expenses, c));
    }
    return(expenseBuckets);
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;
    for(final b in buckets) {
      if(b.totalExpense > maxTotalExpense) {
        maxTotalExpense = b.totalExpense;
      }
    }
    return(maxTotalExpense);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
