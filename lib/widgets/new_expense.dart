import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return (_NewExpenseState());
  }
}

class _NewExpenseState extends State<NewExpense> {
  var _title = "";

  void _saveTitle(String input) {
    _title = input;
  }

  @override
  Widget build(BuildContext context) {
    return (Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            onChanged: _saveTitle,
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
              ElevatedButton(onPressed: () {
                print(_title);
              }, child: const Text("Save")),
            ],
          ),
        ],
      ),
    ));
  }
}
