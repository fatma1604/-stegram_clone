import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istegram/core/themes/color.dart';
import 'package:istegram/core/widgets/custom_buttom.dart';
import 'package:istegram/core/widgets/textfild.dart';

class AuthScreend extends StatelessWidget {
  final int textFieldCount;
  final int buttonCount;
  final String buttonText1;
  final String buttonText2;
  final VoidCallback? onTap1; // Make onTap1 nullable
  final VoidCallback? onTap2; // Make onTap2 nullable

  final String? hintText1; // Make hintText1 nullable
  final String hintText2;

  // Optional fields for image and texts
  final String? imageUrl; // Optional image URL
  final String? optionalText1; // Optional first text
  final String? optionalText2; // Optional second text
  final String? betweenButtonsText; // Text between buttons

  const AuthScreend({
    super.key,
    this.textFieldCount = 1,
    this.buttonCount = 1,
    this.buttonText1 = 'Button 1',
    this.buttonText2 = 'Button 2',
    this.hintText2 = "sçsç",
    this.onTap1, // Make nullable
    this.onTap2, // Make nullable
    this.hintText1, // Make nullable
    this.imageUrl, // Optional image URL
    this.optionalText1, // Optional first text
    this.optionalText2, // Optional second text
    this.betweenButtonsText, // Optional text between buttons
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();

    FocusNode focusNode1 = FocusNode();
    FocusNode focusNode2 = FocusNode();

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (imageUrl != null) // Show image if URL is provided
                Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                child: Image.asset(
                  imageUrl!,
                  height: 100.h,
                  fit: BoxFit.cover,
                ),
              ),
              if (optionalText1 != null) // Show first optional text

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Text(
                    optionalText1!,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              if (optionalText2 != null) // Show second optional text
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Text(
                    optionalText2!,
                    style:
                        TextStyle(fontSize: 14.sp, fontStyle: FontStyle.italic),
                  ),
                ),

              if (hintText1 != null)
                CustomTextField(
                  controller: controller1,
                  focusNode: focusNode1,
                  hintText: hintText1!,
                ),
              if (textFieldCount > 1) ...[
                SizedBox(height: 20.h),
                CustomTextField(
                  controller: controller2,
                  focusNode: focusNode2,
                  hintText: hintText2,
                ),
              ],
              SizedBox(
                  height: 40.h), // Add space between text fields and buttons
              if (onTap1 != null)
                CustomButton(
                  onTap: onTap1!,
                  text: buttonText1,
                  color: Colors.blue,
                ),
              if (betweenButtonsText != null) // Text between buttons
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    betweenButtonsText!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white // Koyu modda beyaz renk
                          : Colors.black, // Açık modda siyah renk
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              if (buttonCount > 1 && onTap2 != null) ...[
                SizedBox(height: 20.h),
                CustomButton(
                  onTap: onTap2!,
                  text: buttonText2,
                  color: Colors.green,
                )
              ],
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
