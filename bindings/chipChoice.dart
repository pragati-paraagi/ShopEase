import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/container.dart';
import 'package:shop_ease/utils/colors.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';
class TChoiceChip extends StatelessWidget {

  const TChoiceChip({

    super.key,

    required this.text,

    required this.selected,

    this.onSelected,

  });

  final String text;

  final bool selected;

  final void Function(bool)? onSelected;

  @override

  Widget build(BuildContext context) {
    final isColor =THelper.getColor(text)!=null;
    return Theme (

      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),

      child: ChoiceChip(

        label: isColor? const SizedBox(): Text(text),

        selected: selected,

        onSelected: onSelected,

        labelStyle: TextStyle(color: selected ? Tcolors.White: null),

        avatar: isColor? Circular(width: 50, height: 50, backgroundColor: THelper.getColor(text)!): null,

        labelPadding: isColor? const EdgeInsets.all(0): null,

        padding: isColor? const EdgeInsets.all(0): null,

        shape: isColor? const CircleBorder(): null,

        backgroundColor: isColor ? THelper.getColor(text)!: null,

      ), // ChoiceChip

    );

// ChoiceChip
  }
}