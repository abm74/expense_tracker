import 'package:expense_tracker/widgets/chart/chart.dart';
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
        title: 'Flutter Course',
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
        constraints:const BoxConstraints.expand(),
        //  BoxConstraints(minWidth: MediaQuery.of(context).size.width),
        isScrollControlled: true,
        useSafeArea: true,
        showDragHandle: true,
        // elevation: 650,
        context: context,
        builder: (ctx) =>NewExpense(_addNewExpense),
        //  SizedBox(
            //   // width: double.infinity,
            //   // height: double.infinity,
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 5, bottom: 20),
            //     child: NewExpense(_addNewExpense),
            //   ),
            // ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
  }

  void _addNewExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Expense deleted'),
      duration: const Duration(seconds: 4),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onDeleteExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expense Tracker',
          // style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(onPressed: _showBottomSheet, icon: const Icon(Icons.add))
        ],
      ),
      body: width < 600
          ? Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
