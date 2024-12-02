import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istegram/core/themes/color.dart';
import 'package:istegram/core/widgets/custom_buttom.dart';
import 'package:istegram/core/widgets/textfild.dart';

class CustomAuthScreen extends StatelessWidget {
  final int textFieldCount;
  final int buttonCount;
  final String buttonText1;
  final String buttonText2;
  final VoidCallback? onTap1;
  final VoidCallback? onTap2;

  final String? hintText1;
  final String hintText2;

  final String? imageUrl;
  final String? optionalText1;
  final String? optionalText2;
  final String? betweenButtonsText;

  final List<Widget>? customWidgets; // İsteğe bağlı widget listesi

  const CustomAuthScreen({
    super.key,
    this.textFieldCount = 1,
    this.buttonCount = 1,
    this.buttonText1 = 'Button 1',
    this.buttonText2 = 'Button 2',
    this.hintText2 = "Enter Text",
    this.onTap1,
    this.onTap2,
    this.hintText1,
    this.imageUrl,
    this.optionalText1,
    this.optionalText2,
    this.betweenButtonsText,
    this.customWidgets, // Parametre olarak ekliyoruz
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
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (imageUrl != null)
                          Padding(
                            padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                            child: Image.asset(
                              imageUrl!,
                              height: 100.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        if (optionalText1 != null)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            child: Text(
                              optionalText1!,
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        if (optionalText2 != null)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            child: Text(
                              optionalText2!,
                              style: TextStyle(
                                  fontSize: 14.sp, fontStyle: FontStyle.italic),
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
                        if (customWidgets != null)
                          ...customWidgets!, // İsteğe bağlı widget'ları ekliyoruz
                        SizedBox(height: 40.h),
                        if (onTap1 != null)
                          CustomButton(
                            onTap: onTap1!,
                            text: buttonText1,
                            color: Colors.blue,
                          ),
                        if (betweenButtonsText != null)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/forget');
                              },
                              child: Text(
                                betweenButtonsText!,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),

                        if (buttonCount > 1 && onTap2 != null) ...[
                          SizedBox(height: 20.h),
                          CustomButton(
                            onTap: onTap2!,
                            text: buttonText2,
                            color: AppColor.trasparan,
                            borderColor: AppColor.actionColor,
                          ),
                        ],
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
