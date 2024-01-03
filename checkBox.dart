import 'package:flutter/material.dart';

class CheckBoxTheme2{
  CheckBoxTheme2._();

  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if(states.contains(MaterialState.selected)){
        return Color(0xff6CB0A8);
      }
      else{
        return Colors.black87;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states){
      if(states.contains(MaterialState.selected)){
        return Color(0xff10564F);
      }
      else{
        return Colors.transparent;
      }
    })
  );

  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if(states.contains(MaterialState.selected)){
        return Color(0xff6CB0A8);
      }
      else{
        return Colors.black87;
      }
    }),
      fillColor: MaterialStateProperty.resolveWith((states){
        if(states.contains(MaterialState.selected)){
          return Color(0xff10564F);
        }
        else{
          return Colors.transparent;
        }
      })
  );

}