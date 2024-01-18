import 'package:flutter/material.dart';

class TeElevatedButton{
  TeElevatedButton._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Color(0xff6CB0A8),
      backgroundColor: Color(0xff10564F),
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Color(0xff10564F)),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xff6CB0A8)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Color(0xff6CB0A8),
      backgroundColor: Color(0xff10564F),
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Color(0xff10564F)),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xff6CB0A8)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
    ),
  );
}