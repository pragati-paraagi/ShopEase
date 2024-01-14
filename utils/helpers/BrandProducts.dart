import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/appBar.dart';
import 'package:shop_ease/features/authentication/screens/allProducts.dart';
import 'package:shop_ease/features/shop/screens/store.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {

  const BrandProducts({super.key});

  @override

  Widget build(BuildContext context) {

    return const Scaffold(

      appBar: CustomAppBar(title: Text('Nike')),

      body: SingleChildScrollView(

        child: Padding(

            padding: EdgeInsets.all(Tsizes.defaultSpace),

            child: Column(

                children:[

                /// Brand Detail

                BrandCard(),

                SizedBox(height: Tsizes.spaceSection),

                SortProducts(),

            ],

        ), // Column

      ),
      )

// Padding

// SingleChildScrollView

    );
  }
}

//