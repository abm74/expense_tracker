import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _userExpenses = [
    Expense(
        title: 'Flutter_course',
        amount: 19.25,
        category: Category.work,
        dateTime: DateTime.now()),
    Expense(
        title: 'Cheese',
        amount: 15.10,
        category: Category.food,
        dateTime: DateTime.now()),
    Expense(
        title: 'picnic',
        amount: 24,
        category: Category.travel,
        dateTime: DateTime.now()),
  ];
  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          const Text('expenses chart'),
          ExpensesList(expenses: _userExpenses)
        ],
      ),
    );
  }
}
