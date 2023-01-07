import 'package:flutter/material.dart';
import 'package:loginui/components/my.buttom.dart';
import 'package:loginui/components/my.dividerwith.dart';
import 'package:loginui/components/my.forgotpassword.dart';
import 'package:loginui/components/my.lineregisternow.dart';
import 'package:loginui/components/my.squaretile.dart';
import 'package:loginui/components/my.textfield.dart';

class LoginPage extends StatelessWidget {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.02),
            const Icon(Icons.lock, size: 100),
            SizedBox(height: size.height * 0.06),
            Text(
              'Welcome back, you\'ve been missed!',
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            ),
            SizedBox(height: size.height * 0.05),
            MyTextField(
              controller: usernamecontroller,
              hintext: 'Username',
              obscuredtext: false,
            ),
            SizedBox(height: size.height * 0.02),
            MyTextField(
              controller: passwordcontroller,
              hintext: 'Password',
              obscuredtext: true,
            ),
            SizedBox(height: size.height * 0.02),
            const MyForgotPassord(
              phrase: 'Forgot Password?',
            ),
            SizedBox(height: size.height * 0.04),
            MyButtom(ontap: () {}, phrase: 'Sign In'),
            SizedBox(height: size.height * 0.04),
            const MyDividerWith(phrase: 'Or continue with'),
            SizedBox(height: size.height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MySquareTile(imagepath: 'lib/images/google.png'),
                SizedBox(width: size.height * 0.04),
                const MySquareTile(imagepath: 'lib/images/apple.png'),
              ],
            ),
            SizedBox(height: size.height * 0.04),
            const MyLimeRegisterNow(),
          ],
        ),
      ),
    );
  }
}
