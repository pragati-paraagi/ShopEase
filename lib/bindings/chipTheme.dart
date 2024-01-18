import 'package:flutter/material.dart';
import 'package:shop_ease/utils/colors.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Tcolors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Tcolors.bllack),
    selectedColor: Tcolors.primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Tcolors.White,
  ); // ChipTheme Data

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: Tcolors.darkerGrey,
    labelStyle: TextStyle(color: Tcolors.White),
    selectedColor: Tcolors.primaryColor,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Tcolors.White,
  );
}
