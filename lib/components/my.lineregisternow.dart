import 'package:flutter/material.dart';

class MyLimeRegisterNow extends StatelessWidget {
  final String phraseFirst;
  final String phraseSecound;
  final Function()? onTap;
  const MyLimeRegisterNow(
      {super.key,
      required this.onTap,
      required this.phraseFirst,
      required this.phraseSecound});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          phraseFirst,
          style: TextStyle(color: Colors.grey[700]),
        ),
        SizedBox(width: size.height * 0.004),
        GestureDetector(
          onTap: onTap,
          child: Text(
            phraseSecound,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
