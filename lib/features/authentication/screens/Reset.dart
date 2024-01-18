import 'package:flutter/material.dart';
import 'package:shop_ease/features/authentication/controllers/forgetPasswordController.dart';
import 'package:shop_ease/features/authentication/screens/Forget.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_s.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/login.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Tsizes.defaultSpace),
          child: Column(
            children: [
              Image (image: const AssetImage('assets/images/img_9.png'), width: THelper.screenWidth() * 0.6),
              const SizedBox (height: Tsizes.spaceSection),
              Text(Ttexts.changePassTi,

                  style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center), // reas

              const SizedBox(height: 16),
              Text (Ttexts.changePassSub,
                  style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center), // Text

              const SizedBox(height: Tsizes.spaceSection),

              /// Buttone

              SizedBox(

                width: double.infinity,

                child: ElevatedButton(onPressed: () => Get.offAll(() => const LoginScreen()), child: const Text('Done')),

              ),
              const SizedBox(
                height: Tsizes.spaceItems,
              ),
              SizedBox(width: double.infinity, child: TextButton(onPressed: ()=> ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text ('Resend Email',
                style: TextStyle(
                  fontFamily: 'Oregano',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color(0xff10564F),
                ),
              ))),
            ],
          ),
        ),
      ),
    );
  }
}
