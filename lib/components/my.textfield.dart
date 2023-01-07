import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintext;
  final bool obscuredtext;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintext,
    required this.obscuredtext,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.05),
      child: TextField(
        controller: controller,
        obscureText: obscuredtext,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintext,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
