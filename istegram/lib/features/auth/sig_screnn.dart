import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istegram/core/constant/text.dart';
import 'package:istegram/core/constant/text_them.dart';
import 'package:istegram/features/auth/auth_scren.dart';

class SignupScreen extends StatelessWidget {
  final VoidCallback show;
  const SignupScreen(this.show, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(  // Wrap everything in SingleChildScrollView
        child: Column(
          children: [
            AuthScrens(),
            SizedBox(height: 20.h),
            Have(context),
          ],
        ),
      ),
    );
  }

  Widget Have(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            AppText.regissteruser,
            style: AppTextTheme.inactiveTextStyle(context),
          ),
          GestureDetector(
            onTap: show,
            child: Text(
              AppText.login,
              style: AppTextTheme.nextAction(context),
            ),
          ),
        ],
      ),
    );
  }
}
