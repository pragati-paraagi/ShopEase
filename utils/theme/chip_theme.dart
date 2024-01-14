import 'package:flutter/material.dart';

class ChipTheme2{
  ChipTheme2._();

  static ChipThemeData lightChipTheme= ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Color(0xff10564F),
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Color(0xff6CB0A8),
  );

  static ChipThemeData darkChipTheme= ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle: const TextStyle(color: Color(0xff6CB0A8)),
    selectedColor: Color(0xff10564F),
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Color(0xff6CB0A8),
  );
}