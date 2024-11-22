// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:istegram/core/constant/images.dart';
import 'package:istegram/core/constant/text.dart';
import 'package:istegram/core/constant/text_them.dart';
import 'package:istegram/core/themes/color.dart';
import 'package:istegram/core/widgets/custom_buttom.dart';
import 'package:istegram/core/widgets/textfild.dart';
import 'package:istegram/data/sevice/authenticstion.dart';
import 'package:istegram/features/auth/auth_screen.dart';

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
          child: Column(
            children: [
              SizedBox(width: 96.w, height: 100.h),
              Center(child: Image.asset(AppImage.logo)),
              SizedBox(height: 120.h),
              CustomTextField(
                controller: emailController,
                focusNode: emailFocusNode,
                hintText: AppText.email,
              ),
              SizedBox(height: 15.h),
              CustomTextField(
                controller: passwordController,
                focusNode: passwordFocusNode,
                hintText: AppText.password,
              ),
              SizedBox(height: 25.h),
              CustomButton(
                onTap: () async {
                  await AuthenticationService().signInWithEmailAndPassword(
                    context: context,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
                text: AppText.loginUsar,
                color: AppColor.actionColor,
              ),
              SizedBox(height: 25.h),
              _buildForgetPassword(),
              SizedBox(height: 25.h),
              // Wrapping the Row widget in a Container to fix the layout issue
              Container(
                width: double.infinity,
                child: CustomButton(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthScreen(isLogin: false),
                      ),
                    );
                  },
                  text: AppText.logingo,
                  color: AppColor.trasparan,
                  borderColor: AppColor.actionColor,
                 
                ),
              )
            ],
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
