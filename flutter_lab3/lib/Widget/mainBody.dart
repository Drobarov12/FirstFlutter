// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

import '../Model/Exams.dart';

class MainBody extends StatefulWidget {
  List<Exams> ExamsMap;

  MainBody({required this.ExamsMap});

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List<CleanCalendarEvent>? selectedEvents;

  final Map<DateTime, List<CleanCalendarEvent>> events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      CleanCalendarEvent("Event1",
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 11, 0),
          description: "Event1 description"),
      CleanCalendarEvent("Event2",
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 11, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          description: "Event2 description"),
    ],
  };

  void _handleDate(date) {
    setState(() {
      _selectedDay = date;
      selectedEvents = events[_selectedDay] ?? [];
    });
  }

  @override
  void initState() {
    selectedEvents = events[_selectedDay] ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Calendar(
          startOnMonday: true,
          selectedColor: Colors.blue,
          todayColor: Colors.red,
          eventColor: Colors.green,
          eventDoneColor: Colors.amber,
          bottomBarColor: Colors.deepOrange,
          onDateSelected: (date) {
            return _handleDate(date);
          },
          events: events,
          isExpanded: true,
          dayOfWeekStyle: TextStyle(
            fontSize: 15,
            color: Colors.black12,
            fontWeight: FontWeight.w100,
          ),
          bottomBarTextStyle: TextStyle(color: Colors.red),
          hideBottomBar: false,
          hideArrows: false,
          weekDays: const ['Mon', 'Tue', 'Wen', 'Thu', 'Fri', 'Sat', 'Sun'],
        ),
      ),
    );

    // child: widget.ExamsList.isEmpty
    //     ? Text("No elements")
    //     : ListView.builder(
    //         itemBuilder: (ctx, index) {
    //           return Card(
    //             elevation: 3,
    //             // ignore: prefer_const_constructors
    //             margin: EdgeInsets.symmetric(
    //               vertical: 8,
    //               horizontal: 10,
    //             ),
    //             child: ListTile(
    //               title: Text(widget.ExamsList[index].title),
    //               subtitle: Text(
    //                 DateFormat("yyyy-MM-dd")
    //                     .format(widget.ExamsList[index].dateTime),
    //               ),
    //               trailing: IconButton(
    //                 icon: Icon(Icons.delete),
    //                 onPressed: () => _deleteItem(widget.ExamsList[index].id),
    //               ),
    //             ),
    //           );
    //         },
    //         itemCount: widget.ExamsList.length,
    // ),
  }
}
