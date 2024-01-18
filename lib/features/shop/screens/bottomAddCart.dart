import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/styles/productVertical.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_f.dart';

class BottomAddCart extends StatelessWidget {
  const BottomAddCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);

    return Container(

      padding: const EdgeInsets.symmetric(horizontal: Tsizes.defaultSpace, vertical: Tsizes.defaultSpace / 2),

      decoration: BoxDecoration(

          color: dark ? Tcolors.darkerGrey: Tcolors.light,

          borderRadius: const BorderRadius.only(

            topLeft: Radius.circular(Tsizes.cardRadiusLg),

            topRight: Radius.circular(Tsizes.cardRadiusLg),

          )

      ), // BorderRadius.only, BoxDecoration

      child:

      Row(

        children: [

      Row (

      children: [

      const CircularIcon(

      icon: Iconsax.minus,

        backgroundColor: Tcolors.darkgrey,

        width: 40,

        height: 40,

        color: Tcolors.White,

      ), // TCircularIcon

      const SizedBox(width: Tsizes.spaceItems),

      Text('2', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),

      const SizedBox(width: Tsizes.spaceItems),

      const CircularIcon(

        icon: Iconsax.add,

        backgroundColor: Tcolors.bllack,

        width: 40,

        height: 40,

        color: Tcolors.White,

      ),
      ]// TCircularIcon
    ),
          SizedBox(
            width: 150,
          ),
          ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(Tsizes.md),
            backgroundColor: Colors.black,
            side: BorderSide(color: Colors.white),
          ) ,child: Text('Add to Cart')),

      ],

    ) // Row

//Row





    );
  }
}
