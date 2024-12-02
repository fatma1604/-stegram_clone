// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:istegram/core/constant/images.dart';
import 'package:istegram/core/constant/text.dart';
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

}
/*
customWidgets: [
              Align(
                alignment: Alignment.topLeft, // Ekranın sol üstüne hizala
                child: AppIconTheme.backButton(context),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w), // Add padding to the left
                child: Align(
                  alignment: Alignment.centerLeft, // Ekranın soluna hizala
                  child: Text(
                    AppText.userAccount,
                    style: AppTextTheme.accoount(context),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(left: 20.w), // Add padding to the left
                child: Align(
                  alignment: Alignment.topLeft, // Ekranın soluna hizala
                  child: Text(
                    AppText.forgetuser,
                    style: AppTextTheme.forget(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w), // Add padding to the left
                child: Align(
                  alignment: Alignment.topLeft, // Ekranın soluna hizala
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      AppText.reset,
                      style: AppTextTheme.reset(context),
                    ),
                  ),
                ),
              ),
            ],
 */