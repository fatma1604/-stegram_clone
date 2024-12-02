// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:istegram/core/constant/images.dart';
import 'package:istegram/core/constant/text.dart';
import 'package:istegram/core/constant/text_them.dart';
import 'package:istegram/features/customAuthScreen.dart';

class LoginScrenn extends StatefulWidget {
  final void Function()? onTap;

  const LoginScrenn({super.key, required this.onTap});

  @override
  State<LoginScrenn> createState() => _LoginScrennState();
}

class _LoginScrennState extends State<LoginScrenn> {
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

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
          onTap2: () {},
          imageUrl: AppImage.logo,
          betweenButtonsText: AppText.forget,
        )),
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
