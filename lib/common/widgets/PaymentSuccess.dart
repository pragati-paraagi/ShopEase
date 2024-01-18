import 'package:flutter/material.dart';
import 'package:shop_ease/common/styles/spacing_styles.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:shop_ease/login.dart';
import 'package:shop_ease/utils/navigation.dart';
class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({Key? key}) : super(key: key);

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
                Text('Payment Success !!',

                    style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center), // reas

                const SizedBox(height: 16),
                Text ('Your item will be shipped soon !!',
                    style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center), // Text

                const SizedBox(height: Tsizes.spaceSection),

                /// Buttone

                SizedBox(

                  width: double.infinity,

                  child: ElevatedButton(onPressed: () => Get.offAll(() => const Navigation()), child: const Text('Continue')),

                ),
              ]// Column

          ),
        ),// Padding
      ),
    );
  }
}
