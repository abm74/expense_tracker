import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
 final List<Expense> expenses;
 const ExpensesList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (ctxt, index) => Text(
                expenses[index].title,
                textAlign: TextAlign.center,
              )),
    );
  }
}
