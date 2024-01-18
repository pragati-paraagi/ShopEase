import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_ease/data/repositories/authentication_repository.dart';
import 'package:shop_ease/features/authentication/controllers/network_manager.dart';
import 'package:shop_ease/features/shop/controllers/userControllers.dart';
import 'package:shop_ease/utils/full_screen_loader.dart';

import '../../authentication/controllers/loaders.dart';
class LoginController extends GetxController {

  final rememberMe = false.obs;
  final hidePassword = false.obs;
  final localStorage = GetStorage();
  final email =  TextEditingController();
  final password =  TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

    void onInit(){
      email.text = localStorage.read('REMEMBER_MY_EMAIL');
      password.text = localStorage.read('REMEMBER_MY_PASSWORD');
      super.onInit();

    }

  Future<void> emailAndPasswordSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog('Logging you in ...', 'assets/images/img_15.png');

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        localStorage.write('REMEMBER_MY_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_MY_PASSWORD', password.text.trim());
      }

      final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      TFullScreenLoader.stopLoading();

      if (userCredential != null) {
        AuthenticationRepository.instance.screenRedirect();
      } else {
        Loaders.errorSnackBar(title: 'Oh Snap!', message: 'User credential is null.');
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
      try{
         TFullScreenLoader.openLoadingDialog('Logging you in ...', 'assets/logos/img_9.png');
         final isConnected = await NetworkManager.instance.isConnected();
         if(!isConnected){
           TFullScreenLoader.stopLoading();
           return;
         }

         final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();
         await userController.saveUserRecord(userCredentials);
         TFullScreenLoader.stopLoading();
         AuthenticationRepository.instance.screenRedirect();
      }
      catch(e){
        Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      }
  }
}