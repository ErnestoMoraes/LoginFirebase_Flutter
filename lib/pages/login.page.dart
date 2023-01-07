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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      if (e.code == 'user-not-found') {
        worngEmailMessage();
      } else if (e.code == 'wrong-password') {
        worngPasswordMessage();
      }
    }
  }

  void worngEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const MyAlertDialog(phrase: 'Incorrect Email');
      },
    );
  }

  void worngPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const MyAlertDialog(phrase: 'Incorrect Password');
      },
    );
  }

  void worngNotLoginGoogleandApple() {
    showDialog(
      context: context,
      builder: (context) {
        return const MyAlertDialog(phrase: 'no login from google or apple yet');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.04),
              const Icon(Icons.lock, size: 100),
              SizedBox(height: size.height * 0.06),
              Text(
                'Welcome back, you\'ve been missed!',
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              SizedBox(height: size.height * 0.05),
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
                      onTap: worngNotLoginGoogleandApple),
                  SizedBox(width: size.height * 0.04),
                  MySquareTile(
                      imagepath: 'lib/images/apple.png',
                      onTap: worngNotLoginGoogleandApple),
                ],
              ),
              SizedBox(height: size.height * 0.04),
              const MyLimeRegisterNow(),
              SizedBox(height: size.height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
