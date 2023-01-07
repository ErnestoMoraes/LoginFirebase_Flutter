import 'package:flutter/material.dart';

class MyButtom extends StatelessWidget {
  final String phrase;
  final Function()? ontap;
  const MyButtom({
    super.key,
    required this.ontap,
    required this.phrase,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(size.height * 0.03),
        margin: EdgeInsets.symmetric(horizontal: size.height * 0.05),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            phrase,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
