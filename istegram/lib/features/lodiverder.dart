
import 'package:flutter/material.dart';
import 'package:istegram/core/constant/text.dart';
import 'package:istegram/core/constant/text_them.dart';




class LoginDivider extends StatelessWidget {
  
  // ignore: use_super_parameters
  const LoginDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double mHeight = mediaQueryData.size.height;
   
    // ignore: unused_local_variable
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mHeight / 40),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 2,
              color: Colors.grey[400],
            ),
          ),
          Padding(
          
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(AppText.continueOn, style: AppTextTheme.heading(context)),
          ),
          Expanded(
            child: Divider(
              thickness: 2,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
