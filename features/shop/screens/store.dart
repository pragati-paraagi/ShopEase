
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/styles/productVertical.dart';
import 'package:shop_ease/common/widgets/RoundedContainer.dart';
import 'package:shop_ease/common/widgets/appBar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/gridLayout.dart';
import 'package:shop_ease/features/authentication/screens/home.dart';
import 'package:shop_ease/features/shop/screens/allBrand.dart';
import 'package:shop_ease/utils/colors.dart';
import 'package:shop_ease/common/widgets/container.dart';
import 'package:shop_ease/utils/constants/device_util.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
class Store extends StatelessWidget {
  const Store({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text('Store', style:Theme.of(context).textTheme.headlineMedium,),
          actions: [
            //IconButton(onPressed: (){}, icon: Icon(Iconsax.shopping_bag, color: Tcolors.White,)),
            Stack(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Iconsax.shopping_bag, color: Tcolors.darkgrey,)),
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
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled){
            return [SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: THelper.isDarkMode(context)? Tcolors.bllack : Tcolors.White,
              expandedHeight: 440,
              flexibleSpace: Padding(
                padding: EdgeInsets.all(Tsizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                      height: Tsizes.spaceItems,

                    ),
                    SearchContainer(text: 'Search in Store', showBorder: true, showBackG: false,),
                    SizedBox(
                      height: Tsizes.spaceSection,

                    ),
                    Heading(title: 'Feature Brands', showActionButton: true, onPressed: ()=>Get.to(()=>AllBrandsScreen()),color: Color(0xff10564F),),
                    SizedBox(
                      height: Tsizes.spaceItems/1.5,

                    ),
                    GridLayout(itemCount: 4, mainAxisExtent:80, itemBuilder: (_, index){
                      return BrandCard();
                    }),

                  ],
                ),
              ),
              bottom: TTabBar(
                  
                  tabs: [
                Tab(child: Text('Sports'),),
                Tab(child: Text('LivingSpaces'),),
                Tab(child: Text('TechHub'),),
                Tab(child: Text('Apparel'),),
                Tab(child: Text('Glamour'),),


              ]),
            ),
            ];
          },
          body: TabBarView(children: [
            StoresCategory(),
            StoresCategory(),
            StoresCategory(),
            StoresCategory(),
            StoresCategory(),
          ]),
        ),
      ),
    );
  }
}

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({ super.key, required this.images});
final List<String> images;
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      borderColor: Tcolors.darkgrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: Tsizes.spaceItems),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){},
            child: RoundedContainer(
              padding: EdgeInsets.all(Tsizes.sm),
              showBorder: true,
              backgroundColor: Colors.transparent,
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      width: 56,
                      height: 56,
                      padding: EdgeInsets.all(Tsizes.sm),
                      decoration: BoxDecoration(
                        color: THelper.isDarkMode(context) ? Tcolors.bllack : Tcolors.White,
                        borderRadius: BorderRadius.circular(100),

                      ),
                      child: Image(
                        image: AssetImage('assets/logos/img_5.png'),
                        //color: THelper.isDarkMode(context) ? Tcolors.White : Tcolors.dark,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Tsizes.spaceItems/2,
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
                            Icon(Iconsax.verify5, color: Colors.green[900], size: Tsizes.iconxs,)
                          ],
                        ),
                        Text('250 products', overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children:
              images.map((image) => brandTop(image, context)).toList()
            ,
          ),
        ],
      ),
    );
  }
}


class TTabBar extends StatelessWidget implements PreferredSizeWidget{
  const TTabBar({super.key, required this.tabs});
  
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark= THelper.isDarkMode(context);
    return Material(
      color: dark ? Tcolors.bllack : Tcolors.White,
      child: TabBar(
          isScrollable: true,
          indicatorColor: Tcolors.primaryColor,
          unselectedLabelColor: Tcolors.darkgrey,
          labelColor: THelper.isDarkMode(context)? Tcolors.White :Tcolors.primaryColor,
          tabs: tabs),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}

Widget brandTop(String image, context){
  return Expanded(
    child: RoundedContainer(
        height: 100,
        backgroundColor: THelper.isDarkMode(context) ? Tcolors.darkgrey : Tcolors.light,
        margin: const EdgeInsets.only(right: Tsizes.sm),
        child: Image(image: AssetImage(image), fit: BoxFit.cover,),
    ),
  );
}

class StoresCategory extends StatelessWidget {
  const StoresCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children : [ Padding(padding: EdgeInsets.all(Tsizes.defaultSpace),
        child: Column(
          children: [
            BrandShowCase(images: ['assets/products/img_1.png','assets/products/img_2.png', 'assets/products/img_3.png'],),
            Heading(title: 'You might like', showActionButton: true, onPressed: (){},),
            SizedBox(
              height: Tsizes.spaceItems,
            ),
            GridLayout(itemCount: 4, itemBuilder: (_, index)=>ProductVertical()),
            SizedBox(
              height: Tsizes.spaceSection,
            ),
          ],
        ),
      ),
      ]
    );
  }
}

class BrandCard extends StatelessWidget {
  const BrandCard({super.key, this.ontap});
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: RoundedContainer(
        padding: EdgeInsets.all(Tsizes.sm),
        showBorder: true,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: Container(
                width: 56,
                height: 56,
                padding: EdgeInsets.all(Tsizes.sm),
                decoration: BoxDecoration(
                  color: THelper.isDarkMode(context) ? Tcolors.bllack : Tcolors.White,
                  borderRadius: BorderRadius.circular(100),

                ),
                child: Image(
                  image: AssetImage('assets/logos/img_5.png'),
                  //color: THelper.isDarkMode(context) ? Tcolors.White : Tcolors.dark,
                ),
              ),
            ),
            SizedBox(
              width: Tsizes.spaceItems/2,
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
                      Icon(Iconsax.verify5, color: Colors.green[900], size: Tsizes.iconxs,)
                    ],
                  ),
                  Text('250 products', overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
