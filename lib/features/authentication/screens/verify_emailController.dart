import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/Success.dart';
import 'package:shop_ease/data/repositories/authentication_repository.dart';

import '../controllers/loaders.dart';
class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit(){
    sendEmailVerification();
    setTimeForAutoRedirect();
    super.onInit();
  }
  sendEmailVerification() async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      Loaders.successSnackBar(title: 'E-mail Sent!', message: 'Please Check your inbox and verify your email.');
    }
    catch(e){
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
  setTimeForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false){
        timer.cancel();
        Get.off(
              ()=> SuccessScreen(
            onpressed: ()=> AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    } );
  }
  checkEmailVerificationStatus() async {
  final currentUser = FirebaseAuth.instance.currentUser;
  if(currentUser != null && currentUser.emailVerified){
    Get.off(
          ()=> SuccessScreen(
        onpressed: ()=> AuthenticationRepository.instance.screenRedirect(),
      ),
    );

}
}
}