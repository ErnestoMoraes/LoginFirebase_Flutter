import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  final String phrase;
  const MyAlertDialog({super.key, required this.phrase});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[900],
      title: Text(
        textAlign: TextAlign.center,
        phrase,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
