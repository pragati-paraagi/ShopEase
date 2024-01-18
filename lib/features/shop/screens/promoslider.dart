import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shop_ease/features/authentication/screens/home.dart';
import 'package:shop_ease/common/widgets/container.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/features/shop/controllers/homeController.dart';
import 'package:get/get.dart';
import 'package:shop_ease/utils/colors.dart';
class PromoS extends StatelessWidget {
  const PromoS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
            options:CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) => controller.updatePageIndicator(index)
            ),
            items:[
              RoundImage(imageUrl: 'assets/icons/img_2.png', width: 370,backgroundColr: Colors.black87,),
              RoundImage(imageUrl: 'assets/icons/img_4.png',width: 370,backgroundColr: Colors.black87,fit: BoxFit.cover,),
              RoundImage(imageUrl: 'assets/icons/img_3.png',width: 370,backgroundColr: Colors.black87,),
            ]),
        const SizedBox(
          height: Tsizes.spaceItems,
        ),
        Center(
          child: Obx(
              ()=> Row(
                mainAxisSize: MainAxisSize.min,
              children: [
                for(int i=0; i<3; i++)  Circular(width: 20, height: 10, margin: EdgeInsets.only(right: 10),backgroundColor: controller.carousalCurrentIndex.value == i ? Tcolors.primaryColor : Colors.blueGrey,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
