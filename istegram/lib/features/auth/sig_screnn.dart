// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:istegram/core/constant/images.dart';
import 'package:istegram/core/constant/text.dart';
import 'package:istegram/core/constant/text_them.dart';
import 'package:istegram/features/customAuthScreen.dart';
import 'package:istegram/language_button.dart';

class SignupScreen extends StatefulWidget {
  final void Function()? onTap;
  const SignupScreen({super.key, required this.onTap});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
            child: CustomAuthScreen(
          buttonCount: 2,
          textFieldCount: 2,
          hintText1: AppText.email,
          hintText2: AppText.password,
          buttonText1: AppText.loginUsar,
          buttonText2: AppText.account,
          onTap1: () {
          
          },
          onTap2: () {
     
          },
          imageUrl: AppImage.logo,
          betweenButtonsText: AppText.forget,
        )),
        Positioned(
          left: 0,
          right: 0,
          top: MediaQuery.of(context).size.height / 13 - 25,
          child: const Center(
            child: LanguageButton(),
          ),
        ),
      ],
    );
  }

  Widget _buildForgetPassword() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/forget');
        },
        child: Text(
          AppText.forget,
          style: AppTextTheme.bodyText(context),
        ),
      ),
    );
  }
}
