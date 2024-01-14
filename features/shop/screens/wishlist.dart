import 'package:flutter/material.dart';
import 'package:shop_ease/common/styles/productVertical.dart';
import 'package:shop_ease/common/widgets/appBar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/gridLayout.dart';
import 'package:shop_ease/features/authentication/screens/home.dart';
import 'package:shop_ease/utils/colors.dart';
import 'package:get/get.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          IconButton(onPressed: ()=> Get.to(HomeScreen()), icon: Icon(Iconsax.add, color: Tcolors.darkgrey,)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Tsizes.defaultSpace),
          child: Column(
            children: [
              GridLayout(itemCount: 6, itemBuilder: (_,index)=>ProductVertical(),)
            ],
          ),
        ),
      ),
    );
  }
}
