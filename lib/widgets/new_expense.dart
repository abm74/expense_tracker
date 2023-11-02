import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextField(
          maxLength: 40,
          decoration: InputDecoration(
            label: Text('Title'),
          ),
        ),
      ],
    );
  }
}
