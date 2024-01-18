import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/RoundedContainer.dart';
import 'package:shop_ease/utils/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

import '../../../utils/helpers/helper_f.dart';

class TSingleAddress extends StatelessWidget {

  const TSingleAddress({

    super.key,

    required this.selectedAddress,

  });

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);

    return RoundedContainer(
      
      width: double.infinity,

      showBorder: true,

      backgroundColor: selectedAddress
          ? Tcolors.primaryColor.withOpacity(0.5)
          : Colors.transparent,

      borderColor: selectedAddress

          ? Colors.transparent

          : dark

          ? Tcolors.darkerGrey

          : Tcolors.grey,

      margin: const EdgeInsets.only(bottom: Tsizes.spaceItems),

      child: Stack(

          children: [

            Positioned(
              right: 20,
              child: Icon(

                selectedAddress ? Iconsax.tick_circle5 : null,
                color: selectedAddress ? dark ? Tcolors.light : Tcolors.dark : null,
              ),
            ),
    Column(

    crossAxisAlignment: CrossAxisAlignment.start,

    children:[

    Text(

    'Pragati Agrahari',

    maxLines: 1,

    overflow: TextOverflow.ellipsis,

    style: Theme.of(context).textTheme.titleLarge,

    ),



    const SizedBox(height: Tsizes.sm / 2),

    const Text('+91-468766787', maxLines: 1, overflow: TextOverflow.ellipsis),

    const SizedBox(height: Tsizes.sm/2),


    const Text('4th Floor, SM Apprtment, Lucknow', softWrap: true),
    ]
    ),

//
          ]

// Icon

      ),
    );
  }
}