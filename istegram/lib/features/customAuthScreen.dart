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
  final List<String>? optionalTexts; // List of texts
  final List<TextStyle>? optionalTextStyles; // List of styles
  final String? betweenButtonsText;
  final String? optionalBetweenText;

  final List<IconData>? optionalIcons; // List of icons
  final List<VoidCallback>? onTapIcons; // List of tap actions for the icons

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
    this.optionalTexts,
    this.optionalBetweenText,
    this.optionalTextStyles, // Accept a list of TextStyle
    this.betweenButtonsText,
    this.optionalIcons, // Accept a list of icons
    this.onTapIcons, // Accept a list of tap actions for the icons
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Display optional icons (ArrowBack at the top)
                        if (optionalIcons != null)
                          Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(
                                optionalIcons!.length,
                                (index) {
                                  final icon = optionalIcons![index];
                                  final onTap = onTapIcons != null &&
                                          onTapIcons!.length > index
                                      ? onTapIcons![index]
                                      : () {};
                                  return IconButton(
                                    icon: Icon(icon),
                                    onPressed: onTap,
                                  );
                                },
                              ),
                            ),
                          ),
                        // Optional image
                        if (imageUrl != null)
                          Padding(
                            padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                            child: Center(
                              child: Image.asset(
                                imageUrl!,
                                height: 100.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        // Optional texts with custom left padding
                        if (optionalTexts != null)
                          ...List.generate(
                            optionalTexts!.length,
                            (index) {
                              final text = optionalTexts![index];
                              final style = optionalTextStyles != null
                                  ? optionalTextStyles![index]
                                  : TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold);
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 20.h, top: 5.h, bottom: 5.h),
                                child: Text(
                                  text,
                                  style: style,
                                ),
                              );
                            },
                          ),

                        SizedBox(height: 20.h),

                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 20.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
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
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Optional text between text fields and buttons
                        if (optionalBetweenText != null)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: Text(
                              optionalBetweenText!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        SizedBox(height: 40.h),
                        // Display the buttons
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
                              child: Center(
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
