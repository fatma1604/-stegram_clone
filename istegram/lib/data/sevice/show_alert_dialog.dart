import 'package:flutter/material.dart';
import 'package:istegram/core/constant/text_them.dart';
import 'package:istegram/core/themes/color.dart';

showAlertDialog({
  required BuildContext context,
  required String message,
  String? btnText,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 247, 100, 113),
        content: Text(
          message,
          style:AppTextTheme.bodyText(context)
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              btnText ?? "Tamam",
              style: const TextStyle(color:AppColor.primaryBackground),
            ),
          ),
        ],
      );
    },
  );
}
