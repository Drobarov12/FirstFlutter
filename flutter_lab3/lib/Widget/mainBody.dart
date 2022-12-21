// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Model/Exams.dart';

class MainBody extends StatefulWidget {
  List<Exams> ExamsList;

  MainBody({required this.ExamsList});

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  void _deleteItem(String id) {
    setState(() {
      widget.ExamsList.removeWhere((elem) => elem.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.ExamsList.isEmpty
          ? Text("No elements")
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 3,
                  // ignore: prefer_const_constructors
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 10,
                  ),
                  child: ListTile(
                    title: Text(widget.ExamsList[index].title),
                    subtitle: Text(
                      DateFormat("yyyy-MM-dd")
                          .format(widget.ExamsList[index].dateTime),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteItem(widget.ExamsList[index].id),
                    ),
                  ),
                );
              },
              itemCount: widget.ExamsList.length,
            ),
    );
  }
}
