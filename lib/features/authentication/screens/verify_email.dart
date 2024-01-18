import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/Success.dart';
import 'package:shop_ease/data/repositories/authentication_repository.dart';
import 'package:shop_ease/features/authentication/screens/verify_emailController.dart';
import 'package:shop_ease/login.dart';
import 'package:get/get.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';
import 'package:shop_ease/utils/constants/text_s.dart';

class VerifyEmailScreen extends StatelessWidget {

  const VerifyEmailScreen({super.key, this.email});
  final String? email;

  @override

  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [

          IconButton(onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear)),
        ],
      ), // AppBar
      body: SingleChildScrollView(

        child: Padding(

          padding: EdgeInsets.all(Tsizes.defaultSpace),

          child: Column(

              children: [
                Image(image: AssetImage('assets/images/img_4.png',),
                width: THelper.screenWidth() * 1,
                  height: 300,
                ),
                const SizedBox(
                  height: Tsizes.spaceSection,
                ),
                Text(Ttexts.confirmEmail, style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Almarai',
                  fontWeight: FontWeight.bold,
                ), textAlign: TextAlign.center),

                const SizedBox(height: 1),

                Text(email ?? '', style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Almarai'
                ), textAlign: TextAlign.center),

                const SizedBox (height: 20),

                Text(Ttexts.confirmEmailSub, style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Almarai'
                ), textAlign: TextAlign.center),

                const SizedBox (height: Tsizes.spaceSection),

                /// Buttons

                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> controller.checkEmailVerificationStatus(), child: const Text ('Continue'))),

                const SizedBox (height: Tsizes.spaceItems),

                SizedBox(width: double.infinity, child: TextButton(onPressed: ()=>controller.sendEmailVerification(), child: const Text ('Resend Email',
                style: TextStyle(
                  fontFamily: 'Oregano',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color(0xff10564F),
                ),
                ))),

              ]
          ),
        ),),


    );
  }// Scaffold

  }