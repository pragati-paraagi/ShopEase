import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/PaymentSuccess.dart';
import 'package:shop_ease/common/widgets/RoundedContainer.dart';
import 'package:shop_ease/common/widgets/appBar.dart';
import 'package:shop_ease/features/authentication/screens/cart.dart';
import 'package:shop_ease/features/personalization/models/billingAddress.dart';
import 'package:shop_ease/features/personalization/models/billingAmount.dart';
import 'package:shop_ease/features/personalization/models/billingPayment.dart';
import 'package:shop_ease/utils/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';



class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);

    return Scaffold(

    appBar: CustomAppBar (showBack: true, title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall)),

    body: SingleChildScrollView(

    child: Padding(

    padding: const EdgeInsets.all(Tsizes.defaultSpace),

    child: Column (

    children: [

    /// Items in Cart

    const TcartItems (showAdd: false),

    const SizedBox(height: Tsizes.spaceSection),

    /// Coupon TextField
    CouponCode(),
    // TRoundedContainer

    const SizedBox(height: Tsizes.spaceSection),

        RoundedContainer(

            showBorder: true,

            padding: const EdgeInsets.all(Tsizes.md),

            backgroundColor: dark? Tcolors.bllack : Tcolors.White,

            child: Column(

            children:[

            /// Pricing

           BillingAmount(),

        const SizedBox(height: Tsizes.spaceItems),



        // Diviner

        const Divider(),

        const SizedBox (height: Tsizes.spaceItems),



            /// Payment Methods
          BillingPayment(),
            SizedBox(height: Tsizes.spaceItems),

         TBillingAddressSection(),
          ]
            ),
        )
      ]
    )
    )
    ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(1),
        child: ElevatedButton(
          onPressed: ()=>Get.offAll(()=>PaymentSuccessScreen()),
          child: Text('Checkout Rs 1762.01'),
        ),
      ),
    );


  }
}

class CouponCode extends StatelessWidget {
  const CouponCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return RoundedContainer(

      showBorder: true,

      backgroundColor: dark ? Tcolors.dark: Tcolors.White,

      padding: const EdgeInsets.only(top: Tsizes.sm, bottom: Tsizes.sm, right: Tsizes.sm, left: Tsizes.md),

      child: Row(

        children: [

          Expanded(

            child: TextFormField(

              decoration: const InputDecoration(

                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,

                focusedBorder: InputBorder.none,

                enabledBorder: InputBorder.none,

                errorBorder: InputBorder.none,

                disabledBorder: InputBorder.none,
              ), // InputDecoration

            ),// TextFormField

          ),
          SizedBox(
              width: 80,
              child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(

                foregroundColor: dark? Tcolors.White.withOpacity(0.5): Tcolors.dark.withOpacity(0.5),

                backgroundColor : Colors.grey.withOpacity(0.2),

                side: BorderSide (color: Colors.grey.withOpacity(0.1)),

              ), child: Text('Apply')))

        ],



// Rom

      ),
    );
  }
}
