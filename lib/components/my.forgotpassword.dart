import 'package:flutter/material.dart';

class MyForgotPassord extends StatelessWidget {
  final String phrase;
  const MyForgotPassord({super.key, required this.phrase});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.05),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text(
          phrase,
          style: TextStyle(color: Colors.grey[600]),
        )
      ]),
    );
  }
}
