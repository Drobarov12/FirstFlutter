import 'package:flutter/material.dart';
import 'package:flutter_lab3/Widget/ResusibleWidgets.dart';

import 'HomePage.dart';
import 'SignUpPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  _LoginPageStete createState() => _LoginPageStete();
}

class _LoginPageStete extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.40, 20, 0),
          child: Column(
            children: <Widget>[
              reusableTextFild("Enter UserName", false, _emailTextController),
              SizedBox(
                height: 20,
              ),
              reusableTextFild("Enter Password", true, _passTextController),
              SizedBox(
                height: 20,
              ),
              logInSingUpButton(context, true, () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              }),
              signUpOption(),
            ],
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have acount? ",
          style: TextStyle(color: Colors.black87),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpPage()));
          },
          // ignore: prefer_const_constructors
          child: Text(
            "SignUp",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
