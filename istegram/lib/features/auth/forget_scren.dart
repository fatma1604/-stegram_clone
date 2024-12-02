import 'package:flutter/material.dart';

import 'package:istegram/core/constant/text.dart';

import 'package:istegram/features/customAuthScreen.dart';

class ForgetScren extends StatelessWidget {
  const ForgetScren({super.key});
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
            child: CustomAuthScreen(
          buttonCount: 1,
          textFieldCount: 1,
          hintText1: AppText.email,
          buttonText1: AppText.loginUsar,
          onTap1: () {},
        )),
      ],
    );
  }
}
