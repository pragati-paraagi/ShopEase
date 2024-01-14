import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shop_ease/features/authentication/screens/onboarding.dart';
import 'package:shop_ease/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get  instance =>Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady(){
    FlutterNativeSplash.remove();
    screenRedirect();
  }


  screenRedirect() async{
    if(kDebugMode) {
      print('--------GetStorage--------');
      print(deviceStorage.read('isFirstTime'));

    }
    deviceStorage.writeIfNull('isFirstTime', true);
    if (deviceStorage.read('isFirstTime') != true) {
      Get.offAll(() => const LoginScreen());
    } else {
      Get.offAll(() => const OnBoardingScreen());
    }
  }

}