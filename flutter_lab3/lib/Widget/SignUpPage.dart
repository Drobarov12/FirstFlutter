import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_lab3/Widget/ResusibleWidgets.dart';

import 'HomePage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passTextController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Sign UP",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            reusableTextFild("Enter UserName", false, _userNameController),
            const SizedBox(
              height: 20,
            ),
            reusableTextFild("Enter Email", false, _emailTextController),
            const SizedBox(
              height: 20,
            ),
            reusableTextFild("Enter Password", true, _passTextController),
            const SizedBox(
              height: 20,
            ),
            logInSingUpButton(context, false, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            }),
            // logInSingUpButton(context, false, () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => MyHomePage()),
            //   );
            // })
          ],
        )),
      ),
    );
  }
}
