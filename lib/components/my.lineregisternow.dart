import 'package:flutter/material.dart';

class MyLimeRegisterNow extends StatelessWidget {
  const MyLimeRegisterNow({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Not a member?',
          style: TextStyle(color: Colors.grey[700]),
        ),
        SizedBox(width: size.height * 0.004),
        const Text(
          'Register now',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
