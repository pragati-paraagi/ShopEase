import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/features/authentication/screens/home.dart';
import 'package:shop_ease/features/authentication/screens/subCategories.dart';

class THomeCategories extends StatelessWidget {

  const THomeCategories({

    super.key,

  });

  @override

  Widget build(BuildContext context) {

    return SizedBox (

    height: 80,

    child: ListView.builder(

    shrinkWrap: true,

    itemCount: 6,

    scrollDirection: Axis.horizontal,

    itemBuilder: (_,index)
    {
      return Vertical(image: 'assets/images/img_4.png', title: 'Shoes', onTap: () =>
          Get.to(() => const SubCategoriesScreen()),);
    },
          ), // ListView.builder

      );
    }
  }