import 'package:flutter/material.dart';



final class AppRoute {
  const AppRoute._();

 
  static const String myfavori = "/myfavori";
   static const String chatHome = "/chatHome";
  static const String photo = "/photo";
    static const String favori = "/favori";


  static Map<String, WidgetBuilder> get routes => {
  // myfavori: (context) => MyFavorites(),
 // chatHome: (context) => ChatHome(),
 //photo: (context) => PhotoPicker(),
//favori: (context) => Favori(),
  };
}
