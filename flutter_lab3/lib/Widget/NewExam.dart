import 'package:flutter/material.dart';
import 'package:flutter_lab3/Model/Exams.dart';
import 'package:intl/intl.dart';

class NewExam extends StatefulWidget {
  final Function addItem;

  NewExam(this.addItem);

  @override
  State<StatefulWidget> createState() => _NewExamState();
}

class _NewExamState extends State<NewExam> {
  final _naslovController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _vrednostController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();
  final _longitudeController = TextEditingController();
  final _latitudeController = TextEditingController();

  void _submitData() {
    if (_vrednostController.text.isEmpty ||
        _startTimeController.text.isEmpty ||
        _endTimeController.text.isEmpty) {
      return;
    }
    final vnesenNaslov = _naslovController.text;
    final descriptionValue = _descriptionController.text;
    final longitudeValue = _longitudeController.text;
    final latitudeValue = _latitudeController.text;
    final vnesenaVrednost = DateTime.parse(_vrednostController.text);
    final startTimeValue = DateTime.parse(
        _vrednostController.text + " " + _startTimeController.text);
    final endTimeValue = DateTime.parse(
        _vrednostController.text + " " + _endTimeController.text);
    if (vnesenNaslov.isEmpty || descriptionValue.isEmpty) {
      return;
    }

    final newItem = Exams(
      title: vnesenNaslov,
      description: descriptionValue,
      dateOfExam: vnesenaVrednost,
      startTime: startTimeValue,
      endTime: endTimeValue,
      longitude: longitudeValue,
      latitude: latitudeValue,
    );
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
            controller: _descriptionController,
            decoration: InputDecoration(labelText: "Description"),
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            controller: _longitudeController,
            decoration: InputDecoration(labelText: "Longitude"),
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            controller: _latitudeController,
            decoration: InputDecoration(labelText: "Longitude"),
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            controller: _vrednostController,
            decoration: InputDecoration(
                icon: Icon(Icons.calendar_today), labelText: "Enter exam date"),
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
          TextField(
            controller: _startTimeController,
            decoration: InputDecoration(
                icon: Icon(Icons.timer), labelText: "Enter Start Time"),
            readOnly: true,
            onTap: () async {
              TimeOfDay? pickedTime = await showTimePicker(
                initialTime: TimeOfDay.now(),
                context: context,
              );
              if (pickedTime != null) {
                DateTime parsedTime = DateFormat.jm()
                    .parse(pickedTime.format(context).toString());
                String formattedTime =
                    DateFormat('HH:mm:ss').format(parsedTime);
                setState(() {
                  _startTimeController.text = formattedTime;
                });
              } else {
                print("Time is not selected");
              }
            },
          ),
          TextField(
            controller: _endTimeController,
            decoration: InputDecoration(
                icon: Icon(Icons.timer), labelText: "Enter End Time"),
            readOnly: true,
            onTap: () async {
              TimeOfDay? pickedTime = await showTimePicker(
                initialTime: TimeOfDay.now(),
                context: context,
              );
              if (pickedTime != null) {
                DateTime parsedTime = DateFormat.jm()
                    .parse(pickedTime.format(context).toString());
                String formattedTime =
                    DateFormat('HH:mm:ss').format(parsedTime);
                setState(() {
                  _endTimeController.text = formattedTime;
                });
              } else {
                print("Time is not selected");
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
