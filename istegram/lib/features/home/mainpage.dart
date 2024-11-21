
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:istegram/features/auth/auth_screen.dart';
import 'package:istegram/features/home/main_screen.dart';
import 'package:istegram/screens/authToggleScreen.dart';



class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MainScreen();
          } else {
            return  AuthScreen(isLogin: true,);
          }
        },
      ),
    );
  }
}
