import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istegram/core/constant/images.dart';
import 'package:istegram/core/constant/text.dart';
import 'package:istegram/core/constant/text_them.dart';
import 'package:istegram/core/widgets/textfild.dart';
import 'package:istegram/data/sevice/authenticstion.dart';


class LoginScrenn extends StatefulWidget {
final void Function()? onTap;

  const LoginScrenn( {super.key, required this.onTap});

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
                SizedBox(height: 15.h),
                _buildForgetPassword(),
                SizedBox(height: 15.h),
                _buildLoginButton(),
                SizedBox(height: 15.h),
             
              ],
            ),
          ),
        ],
      
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


}
