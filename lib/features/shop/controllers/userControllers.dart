import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/data/repositories/UserRepository.dart';
import 'package:shop_ease/features/authentication/controllers/network_manager.dart';

import '../../../data/repositories/authentication_repository.dart';
import '../../../login.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/full_screen_loader.dart';
import '../../../utils/helpers/reauthLogin.dart';
import '../../authentication/controllers/loaders.dart';
import '../../personalization/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;
  final hidePassword = false.obs;
  final verifyPassword = TextEditingController();
  final verifyEmail = TextEditingController();

  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit(){
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try{
      profileLoading.value=true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    }
    catch(e){
      user(UserModel.empty());
    }
    finally{
      profileLoading.value = false;
    }
  }
  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Convert Name to First and Last Name
        final nameParts =
        UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username =
        UserModel.generateUserName(userCredentials.user!.displayName ?? '');

        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          userName: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        await userRepository.saveUserRecord(user);

        // Now you can do something with the 'user' object, like saving it to a database.
      }
    } catch (e) {
      Loaders.warningSnackBar(
        title: 'Data not saved',
        message:
        'Something went wrong while saving your information, you can resave your data in your profile.',
      );
    }
  }
  void deleteAccountWarningPopup() {
    Get.defaultDialog(

      contentPadding: const EdgeInsets.all(Tsizes.md),

      title: 'Delete Account',

      middleText:

      'Are you sure you want to delete your account permanently? This action is net reversible and all of your data will be removed permanently.',

      confirm: ElevatedButton(

          onPressed: () async => deleteUserAccount(),

          style: ElevatedButton.styleFrom(backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),

          child: const Padding (
              padding: EdgeInsets.symmetric(horizontal: Tsizes.lg),
              child: Text('Delete'))

      ),
      // ElevatedButton

      cancel: OutlinedButton(

        child: const Text('Cancel'),

        onPressed: () => Navigator.of(Get.overlayContext!).pop(),

      ), // OutlinedButton
    );
  }
    /// Delete User Account

  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Processing', 'assets/images/img_9.png');

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;

      final provider = auth.authUser!
          .providerData
          .map((e) => e.providerId)
          .first;

      if (provider.isNotEmpty) {
        // Re Verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount(); // Fix: Add parentheses for method call

          TFullScreenLoader.stopLoading();

          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading(); // Fix: Add parentheses for method call

          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading(); // Fix: Add parentheses for method call

      Loaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }


///RE-AUTHENTICATE before deleting
Future<void> reAuthenticateEmailAndPasswordUser() async{
    try{
      TFullScreenLoader.openLoadingDialog('Processing', 'assets/images/img_9.png');
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      if(!reAuthFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
      }

      await AuthenticationRepository.instance.reAuthenticateEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(()=> LoginScreen());
    }catch (e) {
      TFullScreenLoader.stopLoading(); // Fix: Add parentheses for method call

      Loaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
    }
}
  //  Futuresvoid reduthenticateEmailAndPasswordiser() async
}
