import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/CurvedEdge.dart';
import 'package:shop_ease/common/widgets/appBar.dart';
import 'package:shop_ease/common/widgets/gridLayout.dart';
import 'package:shop_ease/features/authentication/screens/allProducts.dart';
import 'package:shop_ease/features/authentication/screens/cart.dart';
import 'package:shop_ease/features/authentication/screens/homeCategories.dart';
import 'package:shop_ease/features/authentication/screens/subCategories.dart';
import 'package:shop_ease/features/shop/controllers/userControllers.dart';
import 'package:shop_ease/utils/colors.dart';
import 'package:shop_ease/common/widgets/container.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/utils/constants/device_util.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shop_ease/features/shop/screens/promoslider.dart';
import 'package:shop_ease/common/styles/productVertical.dart';

import '../../../utils/helpers/shimmer.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipCurve(
              child: Container(
                color: Tcolors.primaryColor,
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: 400,
                  child: Stack(
                    children: [

                      Positioned(
                          top: -150,
                          right: -250,
                          child: Circular(backgroundColor: Tcolors.textWhite.withOpacity(0.1),)),
                      Positioned(
                          top: 100,
                          right: -300,
                          child: Circular(backgroundColor: Tcolors.textWhite.withOpacity(0.1),)
                      ),
                      Column(
                        children: [
                          CustomAppBar(title: Column(
                            children: [

                              Text('Good Day for Shopping!!',
                              style: Theme.of(context).textTheme.labelMedium!.apply(color: Tcolors.grey),
                              ),
                              Obx(() {
                                if (controller.profileLoading.value) {
                                  return const TShimmerEffect(
                                      width: 80, height: 15);
                                }
                                else {
                                  return Text(controller.user.value.fullName,
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .apply(color: Tcolors.White),

                                  );
                                }
                              }
                              ),
                            ],
                          ),
                          actions: [
                            Stack(
                              children: [
                                IconButton(onPressed: ()=>Get.to(()=>CartScreen()), icon: Icon(Iconsax.shopping_bag, color: Tcolors.White,)),
                                Positioned(
                                  right: 5,
                                  child: Container(
                                    width: 18,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      color: Tcolors.bllack,
                                      borderRadius: BorderRadius.circular(100)
                                    ),
                                    child: Center(
                                      child: Text(
                                        '2', style: Theme.of(context).textTheme.labelLarge!.apply(color: Tcolors.White, fontSizeFactor: 0.8),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                          ),
                          SizedBox(
                            height: Tsizes.spaceSection,
                          ),

                          SearchContainer(text: 'Search in Store'),
                          SizedBox(height: Tsizes.spaceSection,),

                          Padding(padding: EdgeInsets.only(left: Tsizes.defaultSpace),
                           child: Column(
                             children: [
                               const SizedBox(
                                 width: 18,
                               ),
                               Heading(title: 'Popular Categories',onPressed: ()=>Get.to(()=>AllProducts()), showActionButton: true, textColor: Colors.white,),
                               const SizedBox(
                                 height: Tsizes.spaceItems,
                               ),
                               SizedBox(
                                 height: 80,
                                 child: ListView.builder(
                                   shrinkWrap: true,
                                   itemCount: 6,
                                   scrollDirection: Axis.horizontal,
                                   itemBuilder: (_, index){
                                     return Vertical(image: 'assets/images/img_13.png', title: '      Shoes', onTap:()=>Get.to(()=>SubCategoriesScreen()),);
                                   },
                                 ),
                               ),
                               
                             ],
                           ),
                          )
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Tsizes.defaultSpace),
              child: Column(
                children: [
                  PromoS(),
                  SizedBox(
                    height: 14,
                  ),
                 // ProductVertical(),
                  SizedBox(
                    height: Tsizes.spaceSection,
                  ),
                  GridLayout(itemCount: 4, itemBuilder: (_, index)=> ProductVertical(),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClipCurve extends StatelessWidget {
  const ClipCurve({ super.key, this.child,});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurveEdege(),
      child: child,
    );
  }
}

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key, required this.text, this.icon = Iconsax
      .search_normal, this.showBackG = true, this.showBorder = true });

  final String text;
  final IconData? icon;
  final bool showBackG, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(Tsizes.md),
        decoration: BoxDecoration(
          color: showBackG ? dark ? Tcolors.White : Tcolors.White : Colors
              .white,
          borderRadius: BorderRadius.circular(Tsizes.cardRadiusLg),
          border: showBorder ? Border.all(color: Tcolors.grey) : null,
        ),
        child: Row(
          children: [
            Icon(icon, color: Tcolors.darkerGrey,),
            const SizedBox(
              width: Tsizes.spaceItems,
            ),
            Text(text, style: Theme
                .of(context)
                .textTheme
                .headlineSmall,),
          ],
        ),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading(
      {super.key, this.onPressed, this.textColor, this.buttonTitle = 'View All', required this.title, this.showActionButton = true, this.color = Colors.black54});

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme
            .of(context)
            .textTheme
            .headlineSmall!
            .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,),
        if(showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle, style: TextStyle(color: color, fontWeight: FontWeight.bold),))
      ],
    );
  }

}

class Vertical extends StatelessWidget {
  const Vertical({
    Key? key,
    required this.image,
    required this.title,
    this.textColor = Tcolors.White,
    this.backgroundColor = Tcolors.grey,
    this.onTap,
  }) : super(key: key);

  final String image;
  final String title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: Tsizes.spaceItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(Tsizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (THelper.isDarkMode(context) ? Tcolors.bllack : Tcolors.White),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image.asset(image, fit: BoxFit.cover, ),
              ),
            ),
            const SizedBox(
              height: Tsizes.spaceItems / 3,
            ),
            SizedBox(
              width: 65,
              child: Text(title, style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor), maxLines: 1, overflow: TextOverflow.ellipsis,),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundImage extends StatelessWidget {
  const RoundImage({super.key, this.borderR, this.padding, this.onPressed, this.width=150, this.height=158,this.applyRadius = true, required this.imageUrl, this.fit = BoxFit.contain, this.backgroundColr = Tcolors.light, this.isImageN = false, this.borderRad = Tsizes.md});

  final double? width, height;
  final String imageUrl;
  final bool applyRadius;
  final BoxBorder? borderR;
  final Color? backgroundColr;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isImageN;
  final VoidCallback? onPressed;
  final double borderRad;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: borderR,
          color: backgroundColr,
          borderRadius: BorderRadius.circular(borderRad),
        ),
        child: ClipRRect(
            borderRadius: applyRadius ? BorderRadius.circular(borderRad) : BorderRadius.zero,
            child:  Image( image: isImageN ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider, fit: fit,)),
      ),
    );
  }
}

