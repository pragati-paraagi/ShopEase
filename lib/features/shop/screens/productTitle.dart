import 'package:flutter/material.dart';

class TProductTitleText extends StatelessWidget {

  const TProductTitleText({

    super.key,

    required this.title,

    this.smallSize = false,

    this.maxLines = 2,

    this.textAlign = TextAlign.left,
    this.color = Colors.black,

  });

  final String title;

  final bool smallSize;

  final int maxLines;

  final TextAlign? textAlign;
  final Color color;

  @override

  Widget build(BuildContext context) {

    return Text(

        title,

      style: TextStyle(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,

    );

  }

}