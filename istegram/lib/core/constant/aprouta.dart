import 'package:flutter/material.dart';
import 'package:istegram/features/auth/forget_scren.dart';
import 'package:istegram/ileri.dart';



final class AppRoute {
  const AppRoute._();

 
  static const String forget = "/forget";
   static const String ileri = "/ileri";



  static Map<String, WidgetBuilder> get routes => {
  forget: (context) => const ForgetScren(),
 ileri: (context) => const Ileri(),
  };
}
