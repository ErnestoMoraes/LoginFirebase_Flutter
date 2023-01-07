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

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
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
      if (passwordcontroller.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text,
          password: passwordcontroller.text,
        );
        Navigator.of(context).pop();
      } else if (confirmPasswordController.text.isEmpty ||
          passwordcontroller.text.isEmpty) {
        Navigator.of(context).pop();
        showErrorMessage('Password void!');
      } else {
        Navigator.of(context).pop();
        showErrorMessage('Passwords not match!');
      }
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      if (e.code == 'unknown') {
        showErrorMessage('Check your data!');
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
                const Icon(Icons.lock_open_rounded, size: 100),
                SizedBox(height: size.height * 0.04),
                Text(
                  'Let\'s create an account for you!',
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
                MyTextField(
                  controller: confirmPasswordController,
                  hintext: 'Confirm Password',
                  obscuredtext: true,
                ),
                SizedBox(height: size.height * 0.02),
                MyButtom(ontap: signUserUp, phrase: 'Sign Up'),
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
                  phraseFirst: 'Already have an account?',
                  phraseSecound: 'Login now',
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
