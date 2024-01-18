import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/features/personalization/screen/addNewAddress.dart';
import 'package:shop_ease/features/personalization/screen/single_addreses.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

import '../../../common/widgets/appBar.dart';
import '../../../utils/colors.dart';


class Addresses extends StatelessWidget {
  const Addresses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(

        backgroundColor: Tcolors.primaryColor,

        onPressed: () => Get.to(() => const AddNewAddress()),

        child: const Icon(Iconsax.add, color: Tcolors.White),

      ), // FloatingActionButton

      appBar: CustomAppBar (

          showBack: true,

          title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),

          ),
      // TAppBar

          body: const SingleChildScrollView(

              child: Padding (

          padding: EdgeInsets.all(Tsizes.defaultSpace),

          child: Column(

              children: [

              TSingleAddress(selectedAddress: false),

          TSingleAddress(selectedAddress: true),
]
      ),
          ),
      // Column

    ), // Padding

    );

  }
}
