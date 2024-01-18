import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/UserRepository.dart';
import '../../../utils/full_screen_loader.dart';
import '../../personalization/screen/profile.dart';
import '../../shop/controllers/userControllers.dart';
import 'loaders.dart';
import 'network_manager.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();

  final lastName = TextEditingController();

  final userController = UserController.instance;

  final userRepository = Get.put(UserRepository());

  GlobalKey <FormState> updateUserNameFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    initializeNames();

    super.onInit();
  }

  /// Fetch wier record

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;

    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateuserName() async {
    try {
// Start Leading

      TFullScreenLoader.openLoadingDialog(
          'We are updating your Information...', 'assets/images/img_9.png');

// Check Internet Connectivity

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();

        return;
      }
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();

        return;
      }
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      TFullScreenLoader.stopLoading();
      Loaders.successSnackBar(
          title: 'Congratulations', message: 'Your Name has been updated.');

// love to previous screen.

      Get.off(() => const Profile());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}