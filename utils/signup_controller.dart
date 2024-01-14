import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/features/authentication/controllers/network_manager.dart';
import 'package:shop_ease/utils/full_screen_loader.dart';

import '../features/authentication/controllers/loaders.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  final email =TextEditingController();
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final lastname =TextEditingController();
  final username =TextEditingController();
  final password =TextEditingController();
  final firstName=TextEditingController();
  final phoneNumber =TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async{
    try{
      TFullScreenLoader.openLoadingDialog('We are processing your information....', 'assets/images/img_15.png');
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
       // TFullScreenLoader.stopLoading();
        return;
      }
      if(!signupFormKey.currentState!.validate()){
       // TFullScreenLoader.stopLoading();
        return;
      }
      if (!privacyPolicy.value) {

        Loaders.warningSnackBar(

            title: 'Accept Privacy Policy',
            message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use',

        );

    return;
    }
    }
    catch(e){
     Loaders.errorSnackBar(title : 'Oh Snap!', message: e.toString());
    }finally{
      TFullScreenLoader.stopLoading();
    }
  }
}