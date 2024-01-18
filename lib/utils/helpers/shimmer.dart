import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../colors.dart';
import 'helper_f.dart';

class TShimmerEffect extends StatelessWidget {

  const TShimmerEffect({

    Key? key,

    required this.width,

    required this.height,

    this.radius = 15,

    this.color,

  }) : super(key: key);

  final double width, height, radius;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);

    return Shimmer.fromColors(

      baseColor: dark ? Colors.grey [650]! : Colors.grey[300]!,

      highlightColor: dark ? Colors.grey [700]! : Colors.grey [100]!,

      child: Container(

        width: width,

        height: height,

        color: color ?? (dark ? Tcolors.darkerGrey : Tcolors.White),

        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(radius),

        ), // BoxDecoration

      ), // Container

    );

  }
}