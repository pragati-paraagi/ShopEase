import 'package:flutter/material.dart';

class ProdductPrice extends StatelessWidget {
  const ProdductPrice({super.key, this.currency = 'Rs', required this.price, this.isLarge=false, this.maxLines=1, this.lineThrough=false, this.color=Colors.black});
 final String currency, price;
 final int maxLines;
 final bool isLarge;
 final bool lineThrough;
 final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(

      currency+ price,

      maxLines: maxLines,

      overflow: TextOverflow.ellipsis,

      //style: isLarge ? Theme.of(context).textTheme.headlineMedium!.apply(decoration: lineThrough ? TextDecoration.lineThrough: null): Theme.of(context).textTheme.titleLarge!.apply(decoration: lineThrough ? TextDecoration.lineThrough: null),
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
