// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istegram/core/constant/text.dart';
import 'package:istegram/core/constant/text_them.dart';
import 'package:istegram/core/widgets/custom_buttom.dart';
import 'package:istegram/core/widgets/textfild.dart';
import 'package:istegram/features/auth/auth_screen.dart';

class SignupScreen extends StatefulWidget {
  final void Function()? onTap;
  const SignupScreen({super.key, required this.onTap});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
     
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 20.h, left: 20.w), 
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, size: 30),
                    onPressed: () {
                   
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              SizedBox(width: 96.w, height: 100.h),

             
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, 
                  children: [
                    Text(
                    AppText.why_epost  ,
                        style: AppTextTheme.textsStyla(context),
                      textAlign: TextAlign.left, 
                    ),
                    SizedBox(height: 10.h),
                    Text(
                     AppText.user, 
                      style: AppTextTheme.textsStyla(context),
                      textAlign: TextAlign.left, 
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      AppText.privacy,
                      style: AppTextTheme.textsStyla(context),
                      textAlign: TextAlign.left, 
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),

              CustomTextField(
                controller: emailController,
                focusNode: emailFocusNode,
                hintText: AppText.eposta,
              ),
              SizedBox(height: 15.h),
              CustomButton(
                onTap: () async {
                  Navigator.popAndPushNamed(context, '/ileri');
                },
                text: AppText.loginUsar,
                color: Colors.blueAccent,
              ),
              SizedBox(height: 40.h),
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
                  color: Colors.transparent,
                  borderColor: Colors.blueAccent,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
