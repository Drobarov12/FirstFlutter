import 'package:flutter/material.dart';

class ClothesAnswers extends StatelessWidget {
  String answer;
  Function tapped;

  ClothesAnswers(this.tapped, this.answer);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.red,
        primary: Color.fromARGB(255, 4, 248, 12),
      ),
      child: Text(answer),
      // ignore: avoid_print
      onPressed: () {
        tapped();
      },
    );
  }
}
