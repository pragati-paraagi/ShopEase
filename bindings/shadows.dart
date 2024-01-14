import 'package:flutter/material.dart';
import 'package:shop_ease/utils/colors.dart';
class Shadow{
  static final verticalProductShadow= BoxShadow(
    color: Tcolors.darkgrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );
  static final horizontalProductShadow= BoxShadow(
      color: Tcolors.darkgrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2)
  );
}