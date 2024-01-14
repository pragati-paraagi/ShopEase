import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class BillingAmount extends StatelessWidget {
  const BillingAmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

        children: [

          /// SubTotel

          Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),

                Text('1750', style: Theme.of(context).textTheme.bodyMedium),

              ]

          ),

    // Row

          const SizedBox(height: Tsizes.spaceItems / 2),

          /// Shipping Fee

          Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                Text('Shipping Fee', style: Theme.of (context).textTheme.bodyMedium),

                Text('0.0', style: Theme.of(context).textTheme.labelLarge),

              ]

          ),

    // Row

          const SizedBox(height: Tsizes.spaceItems / 2),

          /// Tox Fee

          Row (

              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                Text( 'Tax Fee', style: Theme.of(context).textTheme.bodyMedium),



                Text('Rs 12.01', style: Theme.of(context).textTheme.labelLarge),
              ]
          ),


          const SizedBox(height: Tsizes.spaceItems / 2),
          Row (

              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                Text( 'Order Total', style: Theme.of(context).textTheme.bodyMedium),



                Text('Rs 1762.01', style: Theme.of(context).textTheme.labelLarge),
              ]
          ),
        ]
    );
  }
}
