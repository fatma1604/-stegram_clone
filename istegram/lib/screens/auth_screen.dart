



import 'package:flutter/material.dart';
import 'package:istegram/features/auth/login_screnn.dart';
import 'package:istegram/features/auth/sig_screnn.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool a = true;
  void go() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
  return LoginScrenn(go);
    } else {
 return SignupScreen(go);
    }
  }
}