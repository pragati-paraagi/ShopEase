import 'package:flutter/material.dart';

class OutlineButtonTheme2 {
  OutlineButtonTheme2._();

  static final LightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: const BorderSide(color: Color(0xff10564F)),
      textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

  static final DarkOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Color(0xff6CB0A8),
      side: const BorderSide(color: Color(0xff10564F)),
      textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xff6CB0A8)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}