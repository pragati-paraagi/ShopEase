import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_ease/common/widgets/RoundedContainer.dart';
import 'package:shop_ease/features/authentication/screens/home.dart';
import 'package:shop_ease/utils/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';

class BillingPayment extends StatelessWidget {
  const BillingPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);

    return Column(

      children: [

        Heading(title: 'Payment Method', buttonTitle: "Change", onPressed: () {}),

        const SizedBox(height: Tsizes.spaceItems / 2),

        Row(

          children: [

            RoundedContainer(

              width: 60,

              height: 35,

              backgroundColor: dark? Tcolors.light: Tcolors.White,

              padding: const EdgeInsets.all(Tsizes.sm),

              child: const Image(image: AssetImage('assets/logos/img_9.png'), fit: BoxFit.cover
              ),

            ),// TRoundedContainer

            const SizedBox(width: Tsizes.spaceItems/2),

            Text( 'Paypal', style: Theme.of(context).textTheme.bodyLarge),

          ],

        ) // Row

      ],

    ); // Column
  }
}
