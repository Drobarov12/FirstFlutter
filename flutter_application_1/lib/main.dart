import 'package:flutter/material.dart';
import './clothes.dart';
import 'clothesOptions.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int questionIndex = 0;

  var questions = [
    {
      'question': 'Select hat type',
      'answrt': ['None', 'Cap', 'Hat']
    },
    {
      'question': 'Select wpper budy clothes',
      'answrt': ['None', 'Shirt', 'T-shirt', 'Swatshirt', 'Hoodie'],
    },
    {
      'question': 'Select pants type',
      'answrt': ['None', 'Jeans', 'Trousers'],
    },
    {
      'question': 'Select shose type',
      'answrt': [
        'None',
        'Sneakers',
        'High runners',
        'Boots',
        'Slippers',
        'Flip flops'
      ],
    },
    {
      'question': 'You are ready!',
      'answrt': ['BACK'],
    },
  ];

  void iWasTapped() {
    setState(() {
      if (questionIndex == questions.length - 1) {
        questionIndex = 0;
      } else {
        questionIndex += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello to my app",
      home: Scaffold(
        appBar: AppBar(
          title: Text("196124 Martin"),
          backgroundColor: Colors.grey,
        ),
        body: Column(children: [
          ClothesQuestion(questions[questionIndex]['question'] as String),
          ...(questions[questionIndex]['answrt'] as List<String>).map((e) {
            return ClothesAnswers(iWasTapped, e);
          }),
        ]),
      ),
    );
  }
}
