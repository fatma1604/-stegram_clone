import 'package:flutter/material.dart';
import 'package:istegram/core/constant/text.dart';
import 'package:istegram/core/constant/text_them.dart';
import 'package:istegram/features/customAuthScreen.dart';

class ForgetScren extends StatelessWidget {
  const ForgetScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: CustomAuthScreen(
            optionalIcons: [
              Icons.arrow_back, // This will appear at the top
            ],
            textFieldCount: 1,
            buttonCount: 2,
            hintText1: AppText.email,
            buttonText1: AppText.loginUsar,
            buttonText2: AppText.loginUsar,
            onTap1: () {},
            onTap2: () {},
            optionalTexts: [
              AppText.forgetuser,
              AppText.forgetuser,
              AppText.reset,
            ],
            optionalTextStyles: [
              AppTextTheme.accoount(context),
              AppTextTheme.forget(context),
              AppTextTheme.reset(context),
            ],
            optionalBetweenText: AppText.security,
            betweenButtonsText: AppText.callMobil,
          ),
        ),
      ],
    );
  }
}
