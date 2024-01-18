import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/utils/colors.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';

class Loaders{
  static hideSnackBar() => ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(

        SnackBar(

          elevation: 0,

          duration: const Duration(seconds: 3),

          backgroundColor: Colors.transparent,

          content: Container(

            padding: const EdgeInsets.all(12.0),

            margin: const EdgeInsets.symmetric(horizontal: 30),

            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(30),

              color: THelper.isDarkMode(Get.context!) ? Tcolors.darkerGrey
                  .withOpacity(0.9) : Tcolors.grey.withOpacity(0.9),

            ), // BoxDecoration

            child: Center(child: Text(message, style: Theme
                .of(Get.context!)
                .textTheme
                .labelLarge)),

          ), // Container

        ), //

    );
  }
  static successSnackBar({required title, message, duration = 3}) {

    Get.snackbar (

      title,

      message,

      isDismissible: true,

      shouldIconPulse: true,

      colorText: Colors.white,

      backgroundColor: Tcolors.primaryColor,

      snackPosition: SnackPosition.BOTTOM,

      duration: Duration(seconds: duration),

      margin: const EdgeInsets.all(10),

      icon: const Icon(Iconsax.check, color: Tcolors.White),

    );

  }

  static warningSnackBar({required title, message = ' '}) {
    Get.snackbar(

      title,

      message,

      isDismissible: true,

      shouldIconPulse: true,

      colorText: Tcolors.White,

      backgroundColor: Colors.orange,

      snackPosition: SnackPosition.BOTTOM,

      duration: const Duration(seconds: 3),

      margin: const EdgeInsets.all(20),

      icon: const Icon(Iconsax.warning_2, color: Tcolors.White),

    );
  }

    static errorSnackBar({required title, message = ''}) {

        Get.snackbar (

        title,

        message,

        isDismissible: true,

        shouldIconPulse: true,

        colorText: Tcolors.White,

        backgroundColor: Colors.red.shade600,

        snackPosition: SnackPosition.BOTTOM,

        duration: const Duration(seconds: 3),

        margin: const EdgeInsets.all(20),

        icon: const Icon(Iconsax.warning_2, color: Tcolors.White),

    );




  }

}
