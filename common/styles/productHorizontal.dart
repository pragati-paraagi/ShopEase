import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/styles/productPrice.dart';
import 'package:shop_ease/common/styles/productVertical.dart';
import 'package:shop_ease/common/widgets/RoundedContainer.dart';
import 'package:shop_ease/features/authentication/screens/home.dart';
import 'package:shop_ease/features/shop/screens/productTitle.dart';
import 'package:shop_ease/utils/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';
import 'package:shop_ease/bindings/shadows.dart';
class ProductHorizontal extends StatelessWidget {
  const ProductHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark=THelper.isDarkMode(context);
    return  Container(
        width: 310,
        padding: const EdgeInsets.all(1),
    decoration: BoxDecoration(
    boxShadow:[Shadow.verticalProductShadow],
    borderRadius:  BorderRadius.circular(Tsizes.productImageRadius),
    color: THelper.isDarkMode(context) ? Tcolors.darkerGrey: Tcolors.lightContainer,
    ),
        child: Row(

          children: [

          /// Thumbnail

          RoundedContainer(

          height: 120,

          padding: const EdgeInsets.all(Tsizes.sm),

          backgroundColor: dark? Tcolors.dark: Tcolors.light,

          child: Stack(

              children: [

              /// Thumbnail Image

              const SizedBox(

              height: 120,

              width: 120,

              child: RoundImage(imageUrl: 'assets/images/img_12.png', applyRadius: true),

          ),

          /// Sale Tag

          Positioned(

          top: 0,

          child: RoundedContainer(

              radius: Tsizes.sm,

             // backgroundColor: Tcolors.secondaryColor.withOpacity(0.8),
              backgroundColor: Colors.yellow.withOpacity(0.7),

              padding: const EdgeInsets.symmetric (horizontal: Tsizes.sm, vertical: Tsizes.xs),

          child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: Tcolors.bllack)),

          ), //

          ),

        /// Favourite Icon Button

        const Positioned(

        top: 0,

          right: 0,

          child: CircularIcon(icon: Iconsax.heart5, color: Colors.red),
        ),

]
          )
          ),
         SizedBox (

            width:

            172,

            child:

            Padding(
              padding: EdgeInsets.only(top: Tsizes.sm, left: Tsizes.sm),
              child: Column(

                  children: [

                  Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                              TProductTitleText(title: 'White and Black Nike Shoes', smallSize: true),

                              SizedBox(height: Tsizes.spaceItems/2),

                              Row(
                                children: [
                  Text('Nike', overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(
                    color: Colors.black,
                  )),
                   SizedBox(width: Tsizes.xs,),
                  Icon(Iconsax.verify5, color: Colors.green, size: Tsizes.iconxs,)
                                ],
                              ),
                  ]
                                  ),
                                const Spacer(),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [


                            Flexible(child: ProdductPrice(price: ' 1750.0 - Rs 2500')),

                                  Container (
                    height: 30,
                    width: 30,
                    decoration:  BoxDecoration(

                      color: Tcolors.dark,

                      borderRadius: BorderRadius.only(

                        topLeft: Radius.circular(Tsizes.cardRadiusLg),

                        bottomRight: Radius.circular(Tsizes.productImageRadius),

                      ),

                    ),
                    child: SizedBox(

                      width: Tsizes.iconLg ,

                      height: Tsizes.iconLg,

                      child: Center (child: Icon(Iconsax.add, color: Colors.white)),

                    ),


                        // Row
                                  // Column

                                  ),
                              ]// Padding

                    ),
                    ]
                  ),
            ),

                        ),

              ]
        )
    );
  }
}
