// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginui/components/my.alertdialog.dart';
import 'package:loginui/components/my.buttom.dart';
import 'package:loginui/components/my.dividerwith.dart';
import 'package:loginui/components/my.forgotpassword.dart';
import 'package:loginui/components/my.lineregisternow.dart';
import 'package:loginui/components/my.squaretile.dart';
import 'package:loginui/components/my.textfield.dart';
import 'package:loginui/services/auth.service.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
            backgroundColor: Colors.blue,
          ),
        );
      },
    );

    try {
      if (emailcontroller.text.isEmpty) {
        Navigator.of(context).pop();
        showErrorMessage('Check your email');
      } else if (passwordcontroller.text.isEmpty) {
        Navigator.of(context).pop();
        showErrorMessage('Check your password');
      } else {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text,
          password: passwordcontroller.text,
        );
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      if (e.code == 'unknown') {
        showErrorMessage('Check your data');
      } else if (e.code == 'user-not-found') {
        showErrorMessage('Email not register');
      } else {
        showErrorMessage(e.code);
      }
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertDialog(phrase: message);
      },
    );
  }

  void worngNotLoginApple() {
    showDialog(
      context: context,
      builder: (context) {
        return const MyAlertDialog(phrase: 'no login from Apple yet');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.04),
                const Icon(Icons.lock, size: 100),
                SizedBox(height: size.height * 0.04),
                Text(
                  'Welcome back, you\'ve been missed!',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                SizedBox(height: size.height * 0.04),
                MyTextField(
                  controller: emailcontroller,
                  hintext: 'Email',
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
                MyButtom(ontap: signUserIn, phrase: 'Sign In'),
                SizedBox(height: size.height * 0.04),
                const MyDividerWith(phrase: 'Or continue with'),
                SizedBox(height: size.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MySquareTile(
                      imagepath: 'lib/images/google.png',
                      onTap: () => AuthService().signInWithGoogle(),
                    ),
                    SizedBox(width: size.height * 0.04),
                    MySquareTile(
                        imagepath: 'lib/images/apple.png',
                        onTap: worngNotLoginApple),
                  ],
                ),
                SizedBox(height: size.height * 0.04),
                MyLimeRegisterNow(
                  onTap: widget.onTap,
                  phraseFirst: 'Not a member',
                  phraseSecound: 'Register now',
                ),
                SizedBox(height: size.height * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
