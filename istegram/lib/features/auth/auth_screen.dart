import 'package:flutter/material.dart';
import 'package:istegram/core/themes/color.dart';
import 'package:istegram/features/auth/login_screnn.dart';
import 'package:istegram/features/auth/sig_screnn.dart';

class AuthScreen extends StatelessWidget {
  final bool isLogin;
  final void Function()? onTap;

  const AuthScreen({super.key, required this.isLogin, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.leftGradientColor.withOpacity(0.2),
                AppColor.middleGradientColor,
                AppColor.middleGradientColor,
                AppColor.middleGradientColor,
                AppColor.rightGradientColor.withOpacity(0.2),
              ],
              stops: const [0.0, 0.4, 0.5, 0.6, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: isLogin
                      ? LoginScrenn(onTap: onTap)
                      : SignupScreen(onTap: onTap), // Show SignupScreen when isLogin is false
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
