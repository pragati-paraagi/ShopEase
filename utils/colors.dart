import 'package:flutter/material.dart';

class Tcolors{
  Tcolors._();

  // App Basic Colorss
  static const Color primaryColor = Color(0xff10564F);
  static const Color secondaryColor = Color(0xff5C8374);
  static const Color accent = Color(0xff9EC8B9);


  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors:[
      Color(0xffff9a9e),
      Color(0xffFFD1E3),
      Color(0xffFFD1E3),

    ],
  );

  //Text cOLORS
  static const Color textPrimary = Color(0xff333333);
  static const Color textSecondary = Color(0xff6C757D);
  static const Color textWhite = Colors.white;
  //BACKGROUND COLORS
  static const Color light = Color(0xff6CB0A8);
  static const Color dark = Colors.black54;
  static const Color primaryBack = Color(0xff3F5FF);
  //BACKG CONTAINER
  static const Color lightContainer = Color(0xff5C8374);
  static const Color darkContainer = Color(0xff10564F);

  //Button color
  static const Color buttonPrimary = Color(0xff1B4242);
  static const Color buttonSecondary = Color(0xff5C8374);
  static const Color buttonDisabled = Color(0xff9EC8B9);

  //border
  static const Color borderPrimary = Color(0xff1B4242);
  static const Color borderSecondary = Color(0xff5C8374);

  //Error
  static const Color error =Colors.redAccent;
  static const Color success =Colors.green;
  static const Color warning =Colors.orange;
  static const Color info =Colors.blue;

  //Neutral
  static const Color bllack= Colors.black87;
  static const Color White= Colors.white;
  //static const Color bllack= Colors.black87;
  static const Color darkerGrey= Color(0xff4F4F4F);
  static const Color darkgrey= Color(0xff939393);
  static const Color grey= Color(0xffE0E0E0);
  static const Color softgrey= Color(0xffF4F4F4);
  static const Color lightgrey= Color(0xffF9F9F9);
  static const Color hardgrey= Color(0xffFFFFFF);




}