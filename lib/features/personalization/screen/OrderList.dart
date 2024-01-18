import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/RoundedContainer.dart';
import 'package:shop_ease/utils/colors.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';

import '../../../utils/constants/sizes.dart';

class TorderListItems extends StatelessWidget {

  const TorderListItems({super.key});

  @override

  Widget build(BuildContext context) {

    final dark = THelper.isDarkMode(context);

    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (_,index)=>SizedBox(height: Tsizes.spaceItems,),
      itemBuilder: (_, index)=> RoundedContainer (

      showBorder: true,
      padding: EdgeInsets.all(Tsizes.md),
      backgroundColor: dark? Tcolors.dark: Tcolors.light,

      child: Column (
      mainAxisSize: MainAxisSize.min,
      children: [

      Row (



      children: [

      /// 1 Icon

      Icon(Iconsax.ship),

      SizedBox(width: Tsizes.spaceItems / 2),

      /// 2 Status & Date

      Expanded(
        child: Column(

        mainAxisSize: MainAxisSize.min,

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

        Text (

        'Processing',

        style: Theme.of(context).textTheme.bodyLarge!.apply(color: Tcolors.primaryColor, fontWeightDelta: 1),

        ), // Text

        Text('07 Nov 2024', style: Theme.of(context).textTheme.headlineSmall),

        ],

        ),
      ),
        IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_34, size: Tsizes.iconSm,))// Column

      ],
      ),
        SizedBox(height: 14,),
        Row(
          children: [
            Expanded(
              child: Row (



                children: [

                  /// 1 Icon

                  Icon(Iconsax.tag),

                  SizedBox(width: Tsizes.spaceItems / 2),

                  /// 2 Status & Date

                  Expanded(
                    child: Column(

                      mainAxisSize: MainAxisSize.min,

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text (

                          'Order',

                          style: Theme.of(context).textTheme.labelMedium),

                         // Text

                        Text('#12345', style: Theme.of(context).textTheme.titleLarge),

                      ],

                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_34, size: Tsizes.iconSm,))// Column

                ],
              ),
            ),
            Expanded(
              child: Row (



                children: [

                  /// 1 Icon

                  Icon(Iconsax.calendar),

                  SizedBox(width: Tsizes.spaceItems / 2),

                  /// 2 Status & Date

                  Expanded(
                    child: Column(

                      mainAxisSize: MainAxisSize.min,

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text (

                            'Shipping Date',

                            style: Theme.of(context).textTheme.labelMedium),

                        // Text

                        Text('1 Dec,2023', style: Theme.of(context).textTheme.titleLarge),

                      ],

                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_34, size: Tsizes.iconLg,))// Column

                ],
              ),
            ),
          ],
        ),
      ]
      ),
      ),
    );
  }
}