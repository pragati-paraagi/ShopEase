import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:shop_ease/features/authentication/screens/home.dart';
import 'package:shop_ease/features/personalization/screen/profile.dart';
import 'package:shop_ease/features/personalization/screen/settings.dart';
import 'package:shop_ease/features/shop/screens/wishlist.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';
import 'package:shop_ease/utils/colors.dart';
import 'package:shop_ease/features/shop/screens/store.dart';
class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelper.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index)=> controller.selectedIndex.value = index,
          backgroundColor: darkMode ? Tcolors.bllack : Colors.white,
          indicatorColor: darkMode ? Tcolors.White.withOpacity(0.1) : Tcolors.bllack.withOpacity(0.1),
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label:'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label:'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label:'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label:'Profile'),
          ],
        ),
      ),
      body: Obx(()=>controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [HomeScreen(),Store(),FavScreen(),Settings(), ];
}