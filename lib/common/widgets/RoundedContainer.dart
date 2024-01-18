import 'package:flutter/material.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';
import 'package:shop_ease/utils/colors.dart';
class RoundedContainer extends StatelessWidget {

  const RoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.showBorder = false,
    this.radius = Tsizes.cardRadiusLg,
    this.backgroundColor = Tcolors.White,
    this.borderColor = Tcolors.borderPrimary,
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(

      width: width,
      height: height,
      padding: padding,
      margin: margin,

      decoration: BoxDecoration(
        color: backgroundColor,

        border: showBorder ? Border.all(color: borderColor) : null,

        borderRadius: BorderRadius.circular(radius),

      ),// BoxDecoration
      child: child,

    );
  }
}