import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_ease/bindings/general_bindings.dart';
import 'package:shop_ease/data/repositories/authentication_repository.dart';
import 'package:shop_ease/features/authentication/screens/onboarding.dart';
import 'package:shop_ease/utils/theme/theme.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  final WidgetsBinding widgetBinding = WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  await Firebase.initializeApp().then(
        (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: UniqueKey(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: Color(0xff10564F),
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
