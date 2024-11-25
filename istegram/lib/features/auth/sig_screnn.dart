import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istegram/core/constant/text.dart';
import 'package:istegram/core/constant/text_them.dart';
import 'package:istegram/core/themes/color.dart';
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
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Space out children
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.h, left: 10.w),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, size: 30),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppText.why_epost,
                            style: AppTextTheme.textsStyla(context),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            AppText.user,
                            style: AppTextTheme.textsStyla(context),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            AppText.privacy,
                            style: AppTextTheme.textsStyla(context),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      controller: emailController,
                      focusNode: emailFocusNode,
                      hintText: AppText.eposta,
                    ),
                    SizedBox(height: 12.h),
                    CustomButton(
                      onTap: () async {
                        Navigator.popAndPushNamed(context, '/ileri');
                      },
                      text: AppText.forward,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(height: 30.h),
                    Container(
                      //ceptelefonu ile kaydol
                      width: double.infinity,
                      child: CustomButton(
                        onTap: () {
                          Navigator.pushNamed(context, '/ceps');
                        },
                        text: AppText.phone,
                        color: AppColor.trasparan,
                        borderColor: AppColor.actionColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                TextButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthScreen(isLogin: true),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    AppText.already,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 21, 99, 235),
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
