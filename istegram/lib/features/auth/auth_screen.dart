import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istegram/core/constant/text_them.dart';
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
          // Apply the gradient background
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.leftGradientColor.withOpacity(0.2),
                AppColor.middleGradientColor,
                AppColor.middleGradientColor,
                AppColor.middleGradientColor,
                AppColor.rightGradientColor.withOpacity(0.2),
              ],
              stops: [0.0, 0.4, 0.5, 0.6, 1.0],
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
                      : SignupScreen(onTap: onTap),
                ),
              ),
              _buildRegisterPrompt(context), // Display the prompt inside the Container
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterPrompt(
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            isLogin ? 'Don\'t have an account?' : 'Already have an account?',
            style: AppTextTheme.inactiveTextStyle(context),
          ),
          GestureDetector(
            onTap: () {
              // Navigate to the other screen based on isLogin
              if (isLogin) {
                // Navigate to the SignUp screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen(onTap: onTap)),
                );
              } else {
                // Navigate to the Login screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScrenn(onTap: onTap)),
                );
              }
            },
            child: Text(
              isLogin ? 'Sign Up' : 'Log In',
              style: AppTextTheme.recentLabel(context),
            ),
          ),
        ],
      ),
    );
  }
}
