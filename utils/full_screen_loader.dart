import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/animationLoader.dart';
import 'package:shop_ease/utils/colors.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';
class TFullScreenLoader {


  static void openLoadingDialog(String text, String animation) {
    showDialog(

      context: Get.overlayContext!,
      // Use Get.overlayContext for overlay dialogs

      barrierDismissible: false,
      // The dialog can't be dismissed by tapping outside it

      builder: (_) =>
          PopScope(

            canPop: false, // Disable popping with the back button

            child: Container(

              color: THelper.isDarkMode(Get.context!) ? Tcolors.dark : Tcolors
                  .White,

              width: double.infinity,

              height: double.infinity,

              child: Column(

                children: [

                  const SizedBox(height: 250), // Adjust the spacing as needed

                  TAnimationLoaderWidget(text: text, animation: animation),

                ],

              ),
            ),
          ),
    );
  }
         static stopLoading(){

          Navigator.of(Get.overlayContext!).pop();

         }
}// Column ), // Container ). // PopScope )