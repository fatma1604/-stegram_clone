// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istegram/core/themes/color.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color color;

  final Color borderColor; 
 

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.color,
    this.borderColor =
        Colors.transparent, 
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(25.h),
            border: Border.all(
              color: borderColor, 
              width: 2.0, 
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color:AppColor.pageColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
