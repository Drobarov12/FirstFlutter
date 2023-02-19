import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/clean_calendar_event.dart';

import '../Model/Exams.dart';
import 'NewExam.dart';
import 'mainBody.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<DateTime, List<CleanCalendarEvent>> exams = {};

  void _addItemFunction(BuildContext ct) {
    showModalBottomSheet(
        context: ct,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              child: NewExam(_addNewItemToList),
              behavior: HitTestBehavior.opaque);
        });
  }

  void _addNewItemToList(Exams item) {
    var newItem = CleanCalendarEvent(item.title,
        description: item.description,
        startTime: item.startTime,
        endTime: item.endTime);
    setState(() {
      if (exams.containsKey(item.dateOfExam)) {
        exams[item.dateOfExam]?.add(newItem);
      } else {
        exams.addAll({
          item.dateOfExam: [newItem]
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exams"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _addItemFunction(context),
          )
        ],
      ),
      body: MainBody(ExamsMap: exams),
    );
  }
}
