import 'package:flutter/material.dart';
import 'package:shop_ease/common/styles/spacing_styles.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:shop_ease/login.dart';
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key,required this.onpressed });

  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: SingleChildScrollView(

        child: Padding(

            padding: TSpacingStyle.paddingWithAppBarHeight *2,
            child: Column(

            children: [ /// Image

            Image (image: const AssetImage('assets/images/img_5.png'), width: THelper.screenWidth() * 0.6),
            const SizedBox (height: Tsizes.spaceSection),
            Text('Your Account Successfully Created !!',

            style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center), // reas

            const SizedBox(height: 16),
           Text ('Welcome to your Ultimate Shopping Destination. Your Account is Created. Unleash the Joy Of seamless Online Shopping !!',
               style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center), // Text

           const SizedBox(height: Tsizes.spaceSection),

    /// Buttone

    SizedBox(

       width: double.infinity,

    child: ElevatedButton(onPressed: onpressed, child: const Text('Continue')),

    ),
    ]// Column

    ),
    ),// Padding
    ),
    );
  }
}
