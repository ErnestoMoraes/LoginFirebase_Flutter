import 'package:flutter/material.dart';

class MySquareTile extends StatelessWidget {
  final String imagepath;
  final Function()? onTap;
  const MySquareTile({
    super.key,
    required this.imagepath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(size.height * 0.025),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[200]),
        child: Image.asset(
          imagepath,
          height: size.height * 0.05,
        ),
      ),
    );
  }
}
