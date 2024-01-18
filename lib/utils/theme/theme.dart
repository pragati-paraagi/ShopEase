import 'package:flutter/material.dart';
import 'package:shop_ease/utils/theme/TextFieldTheme.dart';
import 'package:shop_ease/utils/theme/bottomSheetTheme.dart';
import 'textTheme.dart';
import 'ElevatedButton_theme.dart';
import 'appbar.dart';
import 'chip_theme.dart';
import 'checkBox.dart';
import 'outlineButton.dart';
class ThemeApp{
  ThemeApp._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Oregano',
    brightness: Brightness.light,
    primaryColor: Color(0xff10564F),
    scaffoldBackgroundColor: Color(0xffEEF0E5), //EEF0E5   AFC8AD
    textTheme:TextTheme2.lightTextTheme,
    chipTheme: ChipTheme2.lightChipTheme,
    appBarTheme: ThemeAppBar.lightAppBarTheme,
    checkboxTheme: CheckBoxTheme2.lightCheckBoxTheme,
    bottomSheetTheme: BottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TeElevatedButton.lightElevatedButtonTheme,
    outlinedButtonTheme: OutlineButtonTheme2.LightOutlineButtonTheme,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Oregano',
    brightness: Brightness.dark,
    primaryColor: Color(0XFF16796F),
    scaffoldBackgroundColor: Colors.black87,
    textTheme:TextTheme2.darkTextTheme,
    chipTheme: ChipTheme2.darkChipTheme,
    appBarTheme: ThemeAppBar.darkAppBarTheme,
    checkboxTheme: CheckBoxTheme2.darkCheckBoxTheme,
    bottomSheetTheme: BottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TeElevatedButton.darkElevatedButtonTheme,
    outlinedButtonTheme: OutlineButtonTheme2.DarkOutlineButtonTheme,
    inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme,
  );
}