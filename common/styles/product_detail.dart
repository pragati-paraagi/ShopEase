import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:shop_ease/common/styles/productPrice.dart';
import 'package:shop_ease/common/styles/productVertical.dart';
import 'package:shop_ease/features/personalization/screen/Review.dart';
import 'package:shop_ease/features/shop/screens/productAttributes.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';
import '../../features/authentication/screens/home.dart';
import '../../features/shop/screens/bottomAddCart.dart';
import '../../features/shop/screens/productTitle.dart';
import '../../utils/colors.dart';
import '../../utils/constants/sizes.dart';
import '../widgets/CurvedEdge.dart';
import '../widgets/RoundedContainer.dart';
import '../widgets/appBar.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        bottomNavigationBar : BottomAddCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Product Image Slider
            ProductImageSlider(),
          Padding (

              padding: const EdgeInsets.only(right: Tsizes.defaultSpace, left: Tsizes.defaultSpace, bottom: Tsizes.defaultSpace),

              child: Column (

          children: [

              Rating(),
               ProductMetaData(),
               SizedBox(
                 height: 20,
               ),
               Attributes(),
               SizedBox(
                 height: 14,
               ),
            SizedBox(
              width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child: Text('Checkout'))),

            Heading(title: 'Description', showActionButton: false,),
            SizedBox(
              height: 14,
            ),

            const ReadMoreText(


              "Step into peak performance with our Ultimate Performance Sneakers! Engineered for comfort and style, these shoes are your perfect companion for any workout. Lightweight, breathable, and built to last, they provide the support you need to excel in every activity. Elevate your athletic experience – grab your pair now and redefine your fitness journey! 🏃‍♂️👟 #UltimatePerformance #FitnessEssentials #StepUpYourGame",

                trimLines: 2,

                trimMode: TrimMode.Line,

                trimCollapsedText: 'Show more',

            trimExpandedText: 'Less',

            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),

            lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),

          ), //


          const Divider(),

        const SizedBox(height: Tsizes.spaceItems),

        Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

        const Heading(title: 'Reviews (199)', showActionButton: true, color: Color(0xff10564F),),

        IconButton(icon: const Icon(Iconsax.arrow_right_3, size: 18), onPressed: ()=> Get.to(()=>Review())),
            ]

    ), // Row

    const SizedBox(height: Tsizes.spaceSection),

  ]
    )
            

// Padding
          )
          ],
        ),
      ),
    );
  }
}

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark=THelper.isDarkMode(context);
    return ClipCurve(
      child: Container(
        color: dark ? Tcolors.darkerGrey : Tcolors.light,
        padding: EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              // Main Large Image
              SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(Tsizes.productImageRadius * 2),
                  child: Center(
                    child: Image(image: AssetImage('assets/products/img_1.png')),
                  ),
                ),
              ),
              // Image Slider
              Positioned(
                right: 0,
                bottom: 30,
                left: 15,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>
                    const SizedBox(width: Tsizes.spaceItems),
                    itemBuilder: (context, index) => RoundImage(
                      width: 88,
                      backgroundColr:
                      dark ? Tcolors.dark : Tcolors.White,
                      borderR: Border.all(color: Tcolors.primaryColor),
                      padding: const EdgeInsets.all(Tsizes.sm),
                      imageUrl: 'assets/products/img_1.png',
                    ),
                  ),
                ),
              ),
              const CustomAppBar (

                showBack: true,

                actions: [CircularIcon(icon: Iconsax.heart5, color: Colors.red)],

              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Rating extends StatelessWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          /// Rating

          Row(

            children: [

              const Icon(Iconsax.star5, color: Colors.amber, size: 24),

              const SizedBox (width: Tsizes.spaceItems / 2),

              Text.rich(

                  TextSpan(

                      children: [

                        TextSpan(text: '5.0  ', style: Theme.of(context).textTheme.bodyLarge),

                        const TextSpan(text:'(199)'),
                      ]

                  ) // TextSpan

              ) // Text.rich

            ],

          ),
          /// Share Button

          IconButton(onPressed: () {}, icon: const Icon(Icons.share, size:20))



// Row

        ]
    );
  }
}

class ProductMetaData extends StatelessWidget {

  const ProductMetaData({

    super.key,

  });

  @override

  Widget build(BuildContext context) {

    final dark = THelper.isDarkMode(context);

    return Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

    /// Price & Sale Price

    Row(

    children: [

    /// Sale Tag

    RoundedContainer(

    radius: Tsizes.sm,

    backgroundColor: Colors.yellow.withOpacity(0.7),

    padding: const EdgeInsets.symmetric(horizontal: Tsizes.sm, vertical: Tsizes.xs),

    child: Text("25%", style: Theme.of(context).textTheme.labelLarge!.apply(color: Tcolors.bllack)),

    ), // TRoundedContainer

    const SizedBox (width: Tsizes.spaceItems),

    /// Price

    Text(' Rs 2500', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),

    const SizedBox(width: Tsizes.spaceItems),

     ProdductPrice(price: '1750', isLarge: true, color: dark ? Colors.white : Colors.black,),

],
    ),// Row

    const SizedBox(height: Tsizes.spaceItems/1.5),
    Row(

    children: [

     TProductTitleText(title: 'Status', color: dark ? Colors.white : Colors.black,),

    const SizedBox(width: Tsizes.spaceItems),

    Text('In Stock', style: Theme.of(context).textTheme.titleMedium),

    ]

    ),

    const SizedBox(height: Tsizes.spaceItems / 1.5),


// Brand

    Row (

    children: [

    RoundImage(

    imageUrl: 'assets/logos/img_5.png',

    width: 32,

    height: 32,

    backgroundColr: dark ? Tcolors.White: Tcolors.bllack,

    ), // TCircularImage

      Row(
        children: [
          Text('   Nike', overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(
            color: Color(0xff10564F),
          )),
          const SizedBox(width: Tsizes.xs,),
          Icon(Iconsax.verify5, color: Colors.green[900], size: Tsizes.iconxs,)
        ],
      ),
    ],

    ), //


    ],

    ); //

  }

}
