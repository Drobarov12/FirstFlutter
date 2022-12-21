import 'package:flutter/material.dart';
import 'package:flutter_lab3/Model/Exams.dart';
import 'package:intl/intl.dart';
import 'package:nanoid/nanoid.dart';

class NewExam extends StatefulWidget {
  final Function addItem;

  NewExam(this.addItem);

  @override
  State<StatefulWidget> createState() => _NewExamState();
}

class _NewExamState extends State<NewExam> {
  final _naslovController = TextEditingController();
  final _vrednostController = TextEditingController();

  void _submitData() {
    if (_vrednostController.text.isEmpty) {
      return;
    }
    final vnesenNaslov = _naslovController.text;
    final vnesenaVrednost = DateTime.parse(_vrednostController.text);

    if (vnesenNaslov.isEmpty) {
      return;
    }

    final newItem =
        Exams(id: nanoid(5), title: vnesenNaslov, dateTime: vnesenaVrednost);
    widget.addItem(newItem);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: _naslovController,
            decoration: InputDecoration(labelText: "Title"),
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            controller: _vrednostController,
            decoration: InputDecoration(
                icon: Icon(Icons.calendar_today), labelText: "Enter Date"),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                setState(() {
                  _vrednostController.text = formattedDate;
                });
              }
            },
          ),
          TextButton(
            child: Text("SUBMIT"),
            onPressed: () => _submitData(),
          ),
        ],
      ),
    );
  }
}
