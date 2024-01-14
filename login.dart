import 'package:flutter/material.dart';
import 'package:shop_ease/features/authentication/screens/Forget.dart';
import 'package:shop_ease/utils/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/common/styles/spacing_styles.dart';
import 'package:shop_ease/utils/constants/text_s.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:get/get.dart';
import 'signup.dart';
import 'package:shop_ease/utils/navigation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark= THelper.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Tcolors.grey),
                        borderRadius: BorderRadius.circular(500),
                      ),
                      child: Center(
                        child: Image(
                          height: 120,  // Adjust the height according to your needs
                          width: 120,   // Adjust the width according to your needs
                          image: AssetImage('assets/images/img_3.png'),
                        ),
                      ),
                    ),
                  ),


                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      Ttexts.loginTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: Tsizes.sm),
                  Text(
                    Ttexts.loginsub,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:  Tsizes.spaceSection),
                  child: Column(
                    children: [
                       TextFormField(
                         decoration: const InputDecoration(prefixIcon : Icon(Iconsax.direct_right), labelText: 'E-mail'),
                       ),
                       const SizedBox(
                         height: Tsizes.spaceBwField,
                       ),
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          labelText: 'Password',
                          suffixIcon: Icon(Iconsax.eye_slash),
                        ),
                      ),
                      const SizedBox(height: Tsizes.spaceBwField / 2,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(value: true, onChanged: (value){}),
                              const Text('Remember Me'),
                            ],
                          ),

                          TextButton(
                            onPressed: ()=> Get.to(()=> const ForgetPassword()),
                            child: const Text(Ttexts.forgotT,
                            style: TextStyle(
                              color: Color(0xff10564F),
                              fontSize: 15,
                            ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: Tsizes.spaceSection,
                      ),
                      SizedBox(width: double.infinity, child: ElevatedButton(
                        onPressed: ()=>Get.to(Navigation()),
                        child: Text('Sign In'),
                      ),),
                      const SizedBox(
                        height: Tsizes.spaceItems,
                      ),
                      SizedBox(width: double.infinity, child: OutlinedButton(
                        onPressed: ()=> Get.to(()=> const SignUp()),
                        child: Text('Create Account'),

                      ),),
                      // const SizedBox(
                      //   height: 1,
                      // ),
                    ],
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Divider(
                      color: dark ? Tcolors.darkerGrey: Tcolors.grey, thickness: 0.5, indent: 60, endIndent: 5,
                    ),
                  ),
                  Text('Or Sign in With', style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                  Flexible(
                    child: Divider(
                      color: dark ? Tcolors.darkerGrey: Tcolors.grey, thickness: 0.5, indent: 5, endIndent: 60,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Tcolors.grey), borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                      onPressed: (){},
                        icon: const Image(
                          width: 40,
                          height: 40,
                          image: AssetImage('assets/logos/img_2.png'),
                        ),

                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Tcolors.grey), borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                      onPressed: (){

                      },
                      icon: const Image(
                        width: 40,
                        height: 40,
                        image: AssetImage('assets/logos/img_1.png',
                      ),
                    ),
                  ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
