import 'package:flutter/material.dart';

class MyDividerWith extends StatelessWidget {
  final String phrase;
  const MyDividerWith({super.key, required this.phrase});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.05),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 0.7,
              color: Colors.grey[700],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.height * 0.01),
            child: Text(
              phrase,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 0.7,
              color: Colors.grey[700],
            ),
          )
        ],
      ),
    );
  }
}
