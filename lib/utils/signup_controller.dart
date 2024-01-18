import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/data/repositories/UserRepository.dart';
import 'package:shop_ease/data/repositories/authentication_repository.dart';
import 'package:shop_ease/features/authentication/controllers/network_manager.dart';
import 'package:shop_ease/features/authentication/screens/verify_email.dart';
import 'package:shop_ease/features/personalization/models/user_model.dart';
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

  void signup() async{
    try{
      TFullScreenLoader.openLoadingDialog('We are processing your information....', 'assets/images/img_9.png');
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
       TFullScreenLoader.stopLoading();
        return;
      }
      if(!signupFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!privacyPolicy.value) {

        Loaders.warningSnackBar(

            title: 'Accept Privacy Policy',
            message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use',

        );

    return;
    }
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
      final newuser= UserModel(id: userCredential.user!.uid, firstName : firstName.text.trim(), lastName:lastname.text.trim(), userName: username.text.trim(), email:email.text.trim(), phoneNumber: phoneNumber.text.trim(), profilePicture :'');
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newuser);

      Loaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email to continue');

      Get.to(()=>  VerifyEmailScreen(email: email.text.trim(),));
    }
    catch(e){
      TFullScreenLoader.stopLoading();
     Loaders.errorSnackBar(title : 'Oh Snap!', message: e.toString());
    }
  }
}