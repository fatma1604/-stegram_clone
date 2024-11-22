// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController(initialPage: 1);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  String receiverEmail = '';
  String receiverId = '';
  String receiverUsername = '';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final currentUserId = _auth.currentUser?.uid;
    if (currentUserId != null) {
      DocumentSnapshot userDoc =
          await _firebaseFirestore.collection('users').doc(currentUserId).get();
      if (userDoc.exists) {
        setState(() {
          receiverEmail = userDoc['email'];
          receiverId = userDoc.id;
        });
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const AlwaysScrollableScrollPhysics(),
        children: const [
          //PhotoPicker(),
         // Navigations_Screen(),
        /*  ChatPage(
            receiverEmail: receiverEmail,
            receiverId: receiverId,
            receiverUsername: receiverUsername,
          ),*/
        ],
      ),
    );
  }
}
