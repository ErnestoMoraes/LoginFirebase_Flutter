import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  final String phrase;
  const MyAlertDialog({super.key, required this.phrase});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        phrase,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
