import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense(this.onAddExpense, {super.key});

  final void Function(Expense expense) onAddExpense;

  @override
  State<StatefulWidget> createState() {
    return (_NewExpenseState());
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _submitExpenseData() {
    final inputAmount = double.tryParse(_amountController.text);
    final isAmountInvalid = inputAmount == null || inputAmount <= 0;

    if (_titleController.text
        .trim()
        .isEmpty ||
        isAmountInvalid ||
        _selectedDate == null) {
      // Display error.
      showDialog(
        context: context,
        builder: (ctx) =>
            AlertDialog(
              title: const Text("Invalid input!"),
              content: const Text(
                  "Please make sure a valid title, amount and date were entered."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text("Okay"),
                )
              ],
            ),
      );
      return;
    }

    Expense newExpense = Expense(
      title: _titleController.text.trim(),
      amount: inputAmount,
      date: _selectedDate!,
      category: _selectedCategory,);

    widget.onAddExpense(newExpense);
    Navigator.pop(context);
  }

  // showDatePicker returns a "Future" value.
  // Instead of async-await, we can also use .then() on showDatePicker.
  void _displayDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  // Flutter needs to explicitly remove the above controller.
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text(
                "Title",
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 10,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: false,
                  ),
                  decoration: const InputDecoration(
                    prefixText: "\$ ",
                    label: Text(
                      "Amount",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "No date selected!"
                          : formatter.format(_selectedDate!),
                    ),
                    // ! is added after a possibly null value to tell Dart that this value won't be null.
                    IconButton(
                      onPressed: _displayDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map((category) =>
                    DropdownMenuItem(
                      value: category,
                      child: Text(category.name.toUpperCase()),
                    ))
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: _submitExpenseData,
                  child: const Text("Save")),
            ],
          ),
        ],
      ),
    ));
  }
}
