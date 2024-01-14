import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/styles/productPrice.dart';
import 'package:shop_ease/common/styles/productVertical.dart';
import 'package:shop_ease/common/widgets/appBar.dart';
import 'package:shop_ease/features/authentication/screens/checkout.dart';
import 'package:shop_ease/features/authentication/screens/home.dart';
import 'package:shop_ease/features/shop/screens/productTitle.dart';
import 'package:shop_ease/utils/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';

class CartScreen extends StatelessWidget {

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: CustomAppBar(showBack: false, title: Text('Cart', style: Theme
            .of(context)
            .textTheme
            .headlineSmall)),

        body: Padding(

            padding: const EdgeInsets.all(Tsizes.defaultSpace),

            child: Column(
              children: [
                TcartItems(),
              ],
            ),
                ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(1),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: ()=>Get.to(()=>CheckoutScreen(),),
            child: Text('Rs 1750'),
          ),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(

        children: [

          /// Image

          RoundImage(

            imageUrl: 'assets/products/img_1.png',

            width: 60,

            height: 60,

            padding: const EdgeInsets.all(Tsizes.sm),

            backgroundColr: THelper.isDarkMode(
                context)
                ? Tcolors.darkerGrey
                : Tcolors.light,

          ),
          SizedBox(
            width: Tsizes.spaceItems,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Nike', overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(
                      color: Color(0xff10564F),
                    )),
                    const SizedBox(width: Tsizes.xs,),
                    Icon(Iconsax.verify5, color: Colors.green, size: Tsizes.iconxs,),
                  ],
                ),
                Flexible(child: TProductTitleText(title: 'Black and yellow nike Shoes', smallSize: true, color: Color(0xff10564F),)),

                Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(text: 'Color : ', style: TextStyle( color: Color(0xff10564F))),
                          TextSpan(text: 'Yellow  ', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff10564F))),
                          TextSpan(text: 'Size : ', style: TextStyle( color: Color(0xff10564F))),
                          TextSpan(text: 'EU34', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff10564F)),),
                        ]
                    )
                ),
              ],
            ),
          ),
        ]
    );
  }
}

class AddRemove extends StatelessWidget {
  const AddRemove({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(

        children: [

          CircularIcon(

            icon: Iconsax.minus,

            width: 32,

            height: 32,

            size: Tsizes.md,

            color: THelper.isDarkMode(context) ? Tcolors.White: Tcolors.bllack,

            backgroundColor: THelper.isDarkMode(context)? Tcolors.darkerGrey: Tcolors.light,

          ),

          const SizedBox(width: Tsizes.spaceItems),

          Text('2', style: Theme.of(context).textTheme.titleSmall),

          const SizedBox(width: Tsizes.spaceItems),

          const CircularIcon(

            icon: Iconsax.add,

            width: 32,

            height: 32,

            size: Tsizes.md,

            color: Tcolors.White,

            backgroundColor: Tcolors.primaryColor,

          ),
        ]
// TCircularIcon

    );
  }
}

class TcartItems extends StatelessWidget {
  const TcartItems({super.key,this.showAdd = true});
  final bool showAdd;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(

        shrinkWrap: true,

        itemCount: 1,

        separatorBuilder: (_, __) =>
        const SizedBox(height: Tsizes.spaceSection),

        itemBuilder: (_, index) =>
            Column(

                children: [
                  CartItem(),
                  if(showAdd) const SizedBox(height: Tsizes.spaceItems /2),

         if(showAdd)
            const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 2),

                            /// Add Remove Buttons
                            AddRemove(),
                          ],
                        ),
                        SizedBox(
                          width: 170,
                        ),
                        ProdductPrice(price: '1750', color: Color(0xff10564F),)
                        //




                      ]
                  )
                ]
            )
    );
  }
}
