import 'package:flutter/material.dart';

class MyTextField2 extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final IconData icon;


  MyTextField2({@required this.hintText,@required this.obscureText,@required this.controller,@required this.icon});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey))));
  }
}
