// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:istegram/core/constant/text.dart';
import 'package:istegram/core/constant/text_them.dart';
import 'package:istegram/features/customAuthScreen.dart';

class RegisterPhone extends StatelessWidget {
  const RegisterPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
              Expanded(
                child: CustomAuthScreen(
                  optionalIcons: const [
                    Icons.arrow_back, // This will appear at the top
                  ],
                  onTapIcons: [
                    () {
                      Navigator.pop(context);
                    },
                  ],
                  textFieldCount: 1,
                  buttonCount: 2,
                  hintText1: AppText.phonenumber,
                  buttonText1: AppText.forward,
                  buttonText2: AppText.record,
                  onTap1: () {},
                  onTap2: () {
                    Navigator.pushNamed(context, "/epuser");
                  },
                  optionalTexts: const [
                    AppText.phone,
                    AppText.phonenumber,
                    AppText.usernumber,
                    AppText.privacy,
                  ],
                  optionalTextStyles: [
                    AppTextTheme.accoount(context),
                    AppTextTheme.forget(context),
                    AppTextTheme.forget(context),
                    AppTextTheme.forget(context),
                  ],
                  optionalBetweenText: AppText.security,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
