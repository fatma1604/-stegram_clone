import 'package:flutter/material.dart';
import 'package:istegram/core/constant/text.dart';
import 'package:istegram/features/customAuthScreen.dart';
import 'package:istegram/language_button.dart';

class ForgetScren extends StatelessWidget {
  const ForgetScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: CustomAuthScreen(
            onTap1: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ForgetScren()),
              );
            },
            onTap2: () {},
            imageUrl: "images/instagram.png",
            betweenButtonsText: AppText.forget,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: MediaQuery.of(context).size.height / 5 -
              25, // Adjust the -25 to center it
          child: Center(
            child: LanguageButton(),
          ),
        ),
      ],
    );
  }
}
