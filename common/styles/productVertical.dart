import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/styles/product_detail.dart';
import 'package:shop_ease/common/widgets/container.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';
import 'package:shop_ease/utils/colors.dart';
import 'package:shop_ease/bindings/shadows.dart';
import 'package:shop_ease/common/widgets/RoundedContainer.dart';
import 'package:shop_ease/features/authentication/screens/home.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/features/shop/screens/productTitle.dart';
import 'package:shop_ease/common/styles/productPrice.dart';
class ProductVertical extends StatelessWidget {
  const ProductVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Get.to(()=> ProductDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow:[Shadow.verticalProductShadow],
          borderRadius:  BorderRadius.circular(Tsizes.productImageRadius),
          color: THelper.isDarkMode(context) ? Tcolors.darkerGrey: Tcolors.White,
        ),
        child: Column(
          children: [
            RoundedContainer(
              height: 160,
              width: 160,
              padding: EdgeInsets.all(Tsizes.sm),
              backgroundColor: THelper.isDarkMode(context) ? Tcolors.dark : Tcolors.light,
              child: Stack(
                children: [
                  RoundImage(imageUrl: 'assets/products/img.png', applyRadius: true,),
                  Positioned(
                    top: 8,
                    child: RoundedContainer(
                      radius: Tsizes.sm,
                      backgroundColor: Colors.yellow.withOpacity(0.7),
                      padding: EdgeInsets.symmetric(horizontal: Tsizes.sm, vertical: Tsizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color : Tcolors.bllack)),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: CircularIcon(icon: Iconsax.heart5,color: Colors.red,)),

                ],
              ),
            ),
            SizedBox(
              height: Tsizes.spaceItems / 2,
            ),
            Padding(padding: EdgeInsets.only(left: Tsizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TProductTitleText(title: 'Blue and White Wanwo Shoes', smallSize: true,),
                SizedBox(
                  height: Tsizes.spaceItems /2,
                ),
                Row(
                  children: [
                    Text('Nike', overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(
                      color: Colors.black,
                    )),
                    const SizedBox(width: Tsizes.xs,),
                    Icon(Iconsax.verify5, color: Colors.black87, size: Tsizes.iconxs,)
                  ],
                ),

              ]
      ),
      ),
            Spacer(),
            Row (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(Tsizes.sm),
                    child: ProdductPrice(price: ' 1199',),
                  ),

                  Container (
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(

                      color: Tcolors.bllack,

                      borderRadius: BorderRadius.only(

                        topLeft: Radius.circular(Tsizes.cardRadiusLg),

                        bottomRight: Radius.circular(Tsizes.productImageRadius),

                      ),

                    ),
                    child: const SizedBox(

                      width: Tsizes.iconLg ,

                      height: Tsizes.iconLg,

                      child: Center (child: Icon(Iconsax.add, color: Colors.white)),

                    ),
                  ),
                ]
            ),
        ]
      ),

      ),
    );



  }
}
class CircularIcon extends StatelessWidget {
  const CircularIcon({super.key, required this.icon, this.width=30, this.height=30, this.size = Tsizes.md, this.onPressed, this.color, this.backgroundColor,});

  final double ? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor!=null ? backgroundColor! : THelper.isDarkMode(context) ? Tcolors.bllack.withOpacity(0.9) : Tcolors.White.withOpacity(0.9),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: color, size: size,),
      ),
    );
  }
}
