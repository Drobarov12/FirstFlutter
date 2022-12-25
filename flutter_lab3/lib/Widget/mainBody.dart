// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

import '../Model/Exams.dart';

class MainBody extends StatefulWidget {
  Map<DateTime, List<CleanCalendarEvent>> ExamsMap;

  MainBody({required this.ExamsMap});

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List<CleanCalendarEvent>? selectedEvents;

  void _handleDate(date) {
    setState(() {
      _selectedDay = date;
      selectedEvents = widget.ExamsMap[_selectedDay] ?? [];
    });
  }

  @override
  void initState() {
    selectedEvents = widget.ExamsMap[_selectedDay] ?? [];
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
          events: widget.ExamsMap,
          isExpanded: true,
          dayOfWeekStyle: TextStyle(
            fontSize: 15,
            color: Colors.black12,
          ),
          bottomBarTextStyle: TextStyle(color: Colors.black),
          hideBottomBar: false,
          hideArrows: false,
          weekDays: const ['Mon', 'Tue', 'Wen', 'Thu', 'Fri', 'Sat', 'Sun'],
        ),
      ),
    );
  }
}
