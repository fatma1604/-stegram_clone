import 'package:flutter/material.dart';
import 'package:istegram/core/themes/color.dart';

class AuthScrens extends StatelessWidget {
  const AuthScrens({super.key});

  @override
  Widget build(BuildContext context) {
    return
 Scaffold(  body:
    SafeArea(
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
      ),
    ),
    );
  }
}
