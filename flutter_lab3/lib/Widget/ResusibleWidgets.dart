import 'package:flutter/material.dart';

TextField reusableTextFild(
    String placeHolderText, bool isPassword, TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPassword,
    enableSuggestions: !isPassword,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.green.withOpacity(0.9)),
    decoration: InputDecoration(
        label: Text(placeHolderText),
        labelStyle: TextStyle(color: Colors.green.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.green.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
    keyboardType:
        isPassword ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}

Container logInSingUpButton(
    BuildContext context, bool isLogIn, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.8,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(isLogIn ? "LOG IN" : "SING UP",
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.green.withOpacity(0.2);
          }
          return Colors.green.withOpacity(0.7);
        }),
      ),
    ),
  );
}
