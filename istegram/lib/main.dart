
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istegram/core/constant/aprouta.dart';
import 'package:istegram/core/themes/theme.dart';
import 'package:istegram/features/home/mainpage.dart';
import 'package:istegram/firebase_options.dart';

// Navigator.pus ==>clean
//=<clean
//icon
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    print("Firebase initialization error: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: AppTheme.lightMode,
        darkTheme: AppTheme.darkMode,
        themeMode: ThemeMode.system,
        routes: AppRoute.routes ,
      home:const ScreenUtilInit(designSize: Size(375, 812), child: MainPage(),
      
      ),
    );
  }
}
