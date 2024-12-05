// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:istegram/core/constant/text.dart';
import 'package:istegram/core/constant/text_them.dart';
import 'package:istegram/features/customAuthScreen.dart';

class EPostaregist extends StatelessWidget {
  const EPostaregist({super.key});

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
                    Icons.arrow_back,
                  ],
                  onTapIcons: [
                    () {
                      Navigator.pop(context); 
                    },
                  ],
                  textFieldCount: 1,
                  buttonCount: 2,
                  hintText1: AppText.eposta,
                  buttonText1: AppText.forward,
                  buttonText2: AppText.phone,
                  onTap1: () {},
                  onTap2: () {
                    Navigator.pushNamed(context, "/ceps");
                  },
                  optionalTexts: const [
                    AppText.why_epost,
                    AppText.user,
                    AppText.privacy,
                  ],
                  optionalTextStyles: [
                    AppTextTheme.accoount(context),
                    AppTextTheme.forget(context),
                    AppTextTheme.forget(context),
                  ],
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
