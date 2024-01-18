import 'package:flutter/material.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
class TSpacingStyle{
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: Tsizes.appBarHeight,
    left: Tsizes.defaultSpace,
    bottom: Tsizes.defaultSpace,
    right: Tsizes.defaultSpace,
  );
}