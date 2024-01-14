import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/appBar.dart';
import 'package:shop_ease/common/widgets/gridLayout.dart';
import 'package:shop_ease/features/authentication/screens/allProducts.dart';
import 'package:shop_ease/features/authentication/screens/home.dart';
import 'package:shop_ease/features/shop/screens/store.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/BrandProducts.dart';

class AllBrandsScreen extends StatelessWidget {

  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBar(title: Text('Brand'), showBack: false),

      body: SingleChildScrollView(

        child: Padding(

          padding: const EdgeInsets.all(Tsizes.defaultSpace),

          child: Column(

              children: [

                /// Heading

                const Heading(title: 'Brands', showActionButton: false),

                const SizedBox(height: Tsizes.spaceItems),

                /// Brands

                GridLayout(itemCount: 10,
                    mainAxisExtent: 80,
                    itemBuilder: (context, index) =>
                           BrandCard(ontap: ()=>Get.to(()=>BrandProducts(),),
                         )),
              ]
          ), // Column

        ),


      ),

// SingleChildScrollView

    );
  }
}