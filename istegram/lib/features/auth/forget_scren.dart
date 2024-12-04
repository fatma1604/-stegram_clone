import 'package:flutter/material.dart';
import 'package:istegram/core/constant/text.dart';
import 'package:istegram/core/constant/text_them.dart';
import 'package:istegram/features/customAuthScreen.dart';
import 'package:istegram/features/lodiverder.dart';

class ForgetScren extends StatelessWidget {
  const ForgetScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
              Expanded(
                child: CustomAuthScreen(
                  optionalIcons: [
                    Icons.arrow_back, // This will appear at the top
                  ],
                  textFieldCount: 1,
                  buttonCount: 2,
                  hintText1: AppText.forgetuser,
                  buttonText1: AppText.continues,
                  buttonText2: AppText.facebook,
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
              const SizedBox(height: 20), // Optional spacing
            ],
          ),
        ),
      ],
    );
  }
}
