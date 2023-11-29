import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  final void Function(Expense expense) onAddExpense;
  const NewExpense(this.onAddExpense, {super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;
  // void _saveTitle(String inputTxt) {
  //   _textWritten = inputTxt;
  //   print(_textWritten);
  // }
  // _NewExpenseState(addNewExpense);

  @override
  void dispose() {
    _amountController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  void _showDatePicker() async {
    var now = DateTime.now();
    var firstDate = DateTime(now.year - 1, now.month, now.day);
    _selectedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {});
  }

  void _saveExpenseData() {
    var emptyInput = _titleController.text.trim().isEmpty ||
        _amountController.text.trim().isEmpty ||
        _selectedDate == null;
    var enteredAmount = double.tryParse(_amountController.text);
    var invalidAmount = enteredAmount == null || enteredAmount <= 0;
    if (emptyInput || invalidAmount) {
      showDialog(
          // barrierDismissible: false,
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('Invalid input'),
              content: const Text('Please enter the information correctly'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Okay'),
                )
              ],
            );
          });
      return;
    }
    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: enteredAmount,
        category: _selectedCategory,
        date: _selectedDate!));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: double.infinity,
      // width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          // padding: const EdgeInsets.symmetric(horizontal: 15),
          padding: EdgeInsets.fromLTRB(15, 0, 15, keyBoardSpace + 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              // padding: const EdgeInsets.symmetric(horizontal: 100),
              // width: 350,
              // width: double.infinity,
              TextField(
                controller: _titleController,
                // onSubmitted: _saveTitle,
                // onEditingComplete: ,
                // onChanged: _saveTitle,
                maxLength: 20,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      maxLength: 14,
                      keyboardType: TextInputType.number,
                      controller: _amountController,
                      style: Theme.of(context).textTheme.bodySmall,
                      decoration: const InputDecoration(
                        prefix: Text('\$'),
                        label: Text('Amount'),
                      ),
                    ),
                  ),
                  // ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(_selectedDate == null
                          ? 'Selected date'
                          : formatter.format(_selectedDate!)),
                      const SizedBox(),
                      IconButton(
                        onPressed: _showDatePicker,
                        icon: const Icon(Icons.calendar_month),
                      )
                    ],
                  ))
                ],
              ),
              const SizedBox(height: 15),
              Row(children: [
                DropdownButton(
                    value: _selectedCategory,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(
                              category.name.toUpperCase(),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedCategory = value;
                      });
                    }),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('cancel'),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: _saveExpenseData,
                  child: const Text('Save Expense'),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
