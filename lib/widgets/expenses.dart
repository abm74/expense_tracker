import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter_course',
        amount: 19.25,
        category: Category.work,
        date: DateTime.now()),
    Expense(
        title: 'Cheese',
        amount: 15.10,
        category: Category.food,
        date: DateTime.now()),
    Expense(
        title: 'picnic',
        amount: 24,
        category: Category.travel,
        date: DateTime.now()),
  ];
  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: NewExpense(),
            ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          IconButton(onPressed: _showBottomSheet, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          const Text('expenses chart'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
