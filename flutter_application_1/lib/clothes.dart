import 'package:flutter/material.dart';

class ClothesQuestion extends StatelessWidget {
  String _question;

  ClothesQuestion(this._question);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Text(
          _question,
          textAlign: TextAlign.center,
          // ignore: prefer_const_constructors
          style: TextStyle(
            fontSize: 30,
            color: Colors.blue,
          ),
        ));
  }
}
