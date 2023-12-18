import 'dart:io';

import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/cupertino.dart';
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

  void _showDialog() {
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (ctx) {
            return CupertinoAlertDialog(
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
    } else {
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
    }
  }

  void _saveExpenseData() {
    var emptyInput = _titleController.text.trim().isEmpty ||
        _amountController.text.trim().isEmpty ||
        _selectedDate == null;
    var enteredAmount = double.tryParse(_amountController.text);
    var invalidAmount = enteredAmount == null || enteredAmount <= 0;
    if (emptyInput || invalidAmount) {
      _showDialog();
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
    final orientation = MediaQuery.of(context).orientation;
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;
    final TextField titleTextField = TextField(
      controller: _titleController,
      // onSubmitted: _saveTitle,
      // onEditingComplete: ,
      // onChanged: _saveTitle,
      maxLength: 20,
      style: Theme.of(context).textTheme.bodySmall,
      decoration: const InputDecoration(
        label: Text('Title'),
      ),
    );
    final TextField amountTextField = TextField(
      maxLength: 14,
      keyboardType: TextInputType.number,
      controller: _amountController,
      style: Theme.of(context).textTheme.bodySmall,
      decoration: const InputDecoration(
        prefix: Text('\$'),
        label: Text('Amount'),
      ),
    );
    final Row datePickerRow = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(_selectedDate == null
            ? 'Selected date'
            : formatter.format(_selectedDate!)),
        const SizedBox(
          width: 5,
        ),
        IconButton(
          onPressed: _showDatePicker,
          icon: const Icon(Icons.calendar_month),
        )
      ],
    );
    final DropdownButton dropdownButton = DropdownButton(
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
        });
    final Row buttonsRow =
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
    ]);
    return LayoutBuilder(builder: (ctx, constraints) {
      final minWidth = constraints.minWidth;
      final maxWidth = constraints.maxWidth;
      return SizedBox(
        height: double.infinity,
        // width: 600,
        child: SingleChildScrollView(
          child: Padding(
            // padding: const EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.fromLTRB(15, 0, 15, keyBoardSpace + 20),
            child:
                // orientation == Orientation.portrait
                maxWidth < 550
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          titleTextField,
                          Row(
                            children: [
                              Expanded(
                                child: amountTextField,
                              ),
                              // ),
                              Expanded(child: datePickerRow)
                            ],
                          ),
                          Row(
                            children: [
                              dropdownButton,
                              const Spacer(),
                              buttonsRow,
                            ],
                          )
                        ],
                      )
                    : Container(
                        // constraints: const BoxConstraints(
                        //   maxWidth: 700,
                        // ),
                        margin: const EdgeInsets.symmetric(horizontal: 100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(flex: 6, child: titleTextField),
                                const Spacer(
                                    // flex: 1,
                                    ),
                                Expanded(
                                  flex: 3,
                                  child: amountTextField,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                dropdownButton,
                                const Spacer(),
                                Expanded(flex: 0, child: datePickerRow),
                                const Spacer(),
                                Expanded(flex: 5, child: buttonsRow)
                              ],
                            ),
                          ],
                        ),
                      ),
          ),
        ),
      );
    });
  }
}

// class NewExpenseLandscape extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
   
//   }
// }
