import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_ease/data/repositories/authentication_repository.dart';
import 'package:shop_ease/utils/full_screen_loader.dart';

import '../screens/Reset.dart';
import 'loaders.dart';
import 'network_manager.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables

  final email = TextEditingController(); // Fixed: Instantiate TextEditingController

  GlobalKey<FormState> forgetPasswordFormkey = GlobalKey<FormState>();

  // Send Reset Email

  sendPasswordResetEmail() async {
    try {
      // Start Loading

      TFullScreenLoader.openLoadingDialog(
          'Processing your request...', 'assets/images/img_3.png');

      // Check Internet Connectivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation

      if (!forgetPasswordFormkey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      TFullScreenLoader.stopLoading();
      Loaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to reset your password');
      Get.to(()=> ResetPassword(email : email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap');
      print('Error: $e'); // Handle errors, you might want to show a message or log it.
    }
  }

  // Resend Password Reset Email

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading

      TFullScreenLoader.openLoadingDialog(
          'Processing your request...', 'assets/images/img_3.png');

      // Check Internet Connectivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation

      // if (!forgetPasswordFormkey.currentState!.validate()) {
      //   TFullScreenLoader.stopLoading();
      //   return;
      // }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email);

      TFullScreenLoader.stopLoading();
      Loaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to reset your password');
      //Get.to(()=> ResetPassword(email : email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap');
      print('Error: $e'); // Handle errors, you might want to show a message or log it.
    }
  }
}
