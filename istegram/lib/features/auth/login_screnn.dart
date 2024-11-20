import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istegram/core/constant/images.dart';
import 'package:istegram/core/constant/text.dart';
import 'package:istegram/core/constant/text_them.dart';
import 'package:istegram/core/widgets/textfild.dart';
import 'package:istegram/data/sevice/authenticstion.dart';
import 'package:istegram/features/auth/auth_scren.dart';

class LoginScrenn extends StatefulWidget {
  final VoidCallback showRegisterPage;

  const LoginScrenn(this.showRegisterPage, {super.key});

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const AuthScrens(), // Gradient background
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
                SizedBox(height: 15.h),
                _buildForgetPassword(),
                SizedBox(height: 15.h),
                _buildLoginButton(),
                SizedBox(height: 15.h),
                _buildRegisterPrompt(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForgetPassword() {
    return Padding(
      padding: EdgeInsets.only(left: 230.w),
      child: GestureDetector(
        onTap: () {
          // Add forget password functionality
        },
        child: Text(AppText.forget, style: AppTextTheme.nextAction(context)),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: InkWell(
        onTap: () async {
          await AuthenticationService().signInWithEmailAndPassword(
            context: context,
            email: emailController.text,
            password: passwordController.text,
          );
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 44.h,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(AppText.login, style: AppTextTheme.headline2(context)),
        ),
      ),
    );
  }

  Widget _buildRegisterPrompt() {
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
            onTap: widget.showRegisterPage,
            child: Text(
              AppText.regisster,
              style: AppTextTheme.recentLabel(context),
            ),
          ),
        ],
      ),
    );
  }
}
