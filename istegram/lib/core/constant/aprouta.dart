import 'package:flutter/material.dart';
import 'package:istegram/features/auth/ceptelefonu.dart';
import 'package:istegram/features/auth/forget_scren.dart';
import 'package:istegram/ileri.dart';

final class AppRoute {
  const AppRoute._();

  static const String forget = "/forget";
  static const String ileri = "/ileri";
  static const String ceps = "/ceps";

  static Map<String, WidgetBuilder> get routes => {
        forget: (context) => const ForgetScren(),
        ileri: (context) => const Ileri(),
        // ignore: equal_keys_in_map
        ceps: (context) => const RegisterPhone(),
      };
}
