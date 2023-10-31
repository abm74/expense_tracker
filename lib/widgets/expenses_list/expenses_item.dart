import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  final Expense expense;
  const ExpensesItem(this.expense, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              // textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 24),
            ),
            Row(
              children: [
                Text(
                  expense.amount.toStringAsFixed(2),
                  textAlign: TextAlign.left,
                  // style: const TextStyle(fontSize: 24),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      expense.formattedDate,
                      // textAlign: TextAlign.left,
                      // style: const TextStyle(fontSize: 24),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
