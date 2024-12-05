import 'package:flutter/material.dart';
import 'package:istegram/features/auth/e_postaRegist.dart';
import 'package:istegram/features/auth/forget_scren.dart';
import 'package:istegram/features/auth/registerPhon.dart';
import 'package:istegram/forward.dart';

final class AppRoute {
  const AppRoute._();

  static const String forget = "/forget";
  static const String ileri = "/ileri";
  static const String ceps = "/ceps";
   static const String epuser = "/epuser";

  static Map<String, WidgetBuilder> get routes => {
        forget: (context) => const ForgetScren(),
        ileri: (context) => const Ileri(),
        ceps: (context) => const RegisterPhone(),
         epuser: (context) => const EPostaregist(),
      };
}
