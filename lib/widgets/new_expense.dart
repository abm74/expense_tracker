import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  // void _saveTitle(String inputTxt) {
  //   _textWritten = inputTxt;
  //   print(_textWritten);
  // }

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
        setState(() {  
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          // padding: const EdgeInsets.symmetric(horizontal: 100),
          width: 350,
          child: TextField(
            controller: _titleController,
            // onSubmitted: _saveTitle,
            // onEditingComplete: ,
            // onChanged: _saveTitle,
            maxLength: 40,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
        ),
        Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            // SizedBox(
            //   width: 120,
            //   child:
            Expanded(
              child: TextField(
                maxLength: 14,
                keyboardType: TextInputType.number,
                controller: _amountController,
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
        Row(children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('cancel'),
          ),
          const SizedBox(
            width: 20,
          ),
          ElevatedButton(
            onPressed: () {
              print(
                  'title: ${_titleController.text}\n amount: ${_amountController.text}');
            },
            child: const Text('submit'),
          )
        ]),
      ]),
    );
  }
}
