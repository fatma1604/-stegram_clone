import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istegram/core/constant/images.dart';
import 'package:istegram/core/constant/text.dart';
import 'package:istegram/core/constant/text_them.dart';
import 'package:istegram/core/themes/color.dart';
import 'package:istegram/data/sevice/authenticstion.dart';

class LoginScrenn extends StatefulWidget {
   final VoidCallback showRegisterPage;
  const LoginScrenn(this.showRegisterPage,{super.key, });

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
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.pageColor,
      body: SafeArea(
         child: Column( children: [
            SizedBox(width: 96.w, height: 100.h),
            Center(child: Image.asset(AppImage.logo)),
            SizedBox(height: 120.h),
            _buildTextField(emailController, emailFocusNode, AppText.email, Icons.email),
            SizedBox(height: 15.h),
            _buildTextField(passwordController, passwordFocusNode, AppText.password, Icons.lock),
            SizedBox(height: 15.h),
            _buildForgetPassword(),
            SizedBox(height: 15.h),
            _buildLoginButton(),
            SizedBox(height: 15.h),
            _buildRegisterPrompt(),
          ],)
      ),
    );
  }
    Widget _buildForgetPassword() {
    return Padding(
      padding: EdgeInsets.only(left: 230.w),
      child: GestureDetector(
        onTap: () {
      
        },
        child: Text(AppText.forget, style: AppTextTheme.nextAction(context)),
      ),
    );
  }
  
  Widget _buildTextField(
    TextEditingController controller,
    FocusNode focusNode,
    String hintText,
    IconData icon,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
          color: AppColor.pageColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: TextField(
          style: AppTextTheme.noMediaFound(context),
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(
              icon,
              color: focusNode.hasFocus ? AppColor.primaryBackground : Colors.grey[600],
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(width: 2.w, color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(width: 2.w, color: AppColor.primaryBackground),
            ),
          ),
        ),
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
          Text(AppText.regissteruser, style: AppTextTheme.inactiveTextStyle(context)),
          GestureDetector(
            onTap: widget.showRegisterPage,
            child: Text(AppText.regisster, style: AppTextTheme.recentLabel(context),
          ),
          ),
        ],
      ),
    );
  }
}