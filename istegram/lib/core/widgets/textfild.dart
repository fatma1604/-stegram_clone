import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;

  CustomTextField({
    required this.controller,
    required this.focusNode,
    required this.hintText,
    super.key,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isTyping = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      isTyping = widget.controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        height: 80.h,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.zero,
        ),
        child: TextField(
          style: TextStyle(
            color: isDarkMode
                ? Colors.white
                : Colors.black, // Ensure text color is visible
            fontSize: 16.sp, // Adjust text size if needed
          ),
          controller: widget.controller,
          focusNode: widget.focusNode,
          decoration: InputDecoration(
            labelText: widget.hintText, // Floating label when typing starts
            floatingLabelBehavior:
                FloatingLabelBehavior.auto, // Floats when focused or typing
            labelStyle: TextStyle(
              color: const Color.fromARGB(
                  122, 255, 255, 255), // Kırmızı renk etiket için
            ),
            filled: true,
            fillColor: const Color.fromARGB(
                38, 255, 255, 255), // Always white, no transparency
            contentPadding:
                EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                  width: 2.w,
                  color: isDarkMode
                      ? const Color.fromARGB(84, 255, 255, 255).withOpacity(0.5)
                      : Colors.blueGrey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                  width: 2.w,
                  color: isDarkMode
                      ? const Color.fromARGB(158, 255, 255, 255)
                          .withOpacity(0.5)
                      : Colors.deepOrange),
            ),
          ),
        ),
      ),
    );
  }
}
