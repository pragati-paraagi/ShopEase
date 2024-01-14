import 'package:flutter/material.dart';
import 'package:shop_ease/features/shop/screens/termsAndCondition.dart';
import 'package:shop_ease/utils/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_s.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';
import 'package:shop_ease/features/authentication/screens/verify_email.dart';
import 'package:get/get.dart';
import 'package:shop_ease/utils/helpers/validation.dart';
import 'package:shop_ease/utils/signup_controller.dart';
class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Tsizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Ttexts.signUp, style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium),
              const SizedBox(
                height: Tsizes.spaceSection,
              ),
              SignUpForm(),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Divider(
                      color: dark ? Tcolors.darkerGrey : Tcolors.grey,
                      thickness: 0.5,
                      indent: 60,
                      endIndent: 5,
                    ),
                  ),
                  Text('Or Sign up With', style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                  Flexible(
                    child: Divider(
                      color: dark ? Tcolors.darkerGrey : Tcolors.grey,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 60,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
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
//         );
//       ),
//     );
//   }
// }

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                validator: (value)=> Validator.validateEmptyText('First Name', value),
                controller: controller.firstName,
                expands: false,
                decoration: const InputDecoration(
                    labelText: 'First Name',
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: TextFormField(
                controller: controller.lastname,
                validator: (value)=> Validator.validateEmptyText('Last Name', value),
                expands: false,
                decoration: const InputDecoration(
                    labelText: 'Last Name',
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        TextFormField(
          controller: controller.username,
          validator: (value)=> Validator.validateEmptyText('Username', value),
          expands: false,
          decoration: const InputDecoration(labelText: 'Username',
              prefixIcon: Icon(Iconsax.user_edit)),
        ),
        const SizedBox(
          height: 16,
        ),
        TextFormField(
          controller: controller.email,
          validator: (value)=> Validator.validateEmail(value),
          expands: false,
          decoration: const InputDecoration(
              labelText: 'E-mail', prefixIcon: Icon(Iconsax.direct)),
        ),
        const SizedBox(
          height: 16,
        ),
        TextFormField(

          controller: controller.phoneNumber,
          validator: (value)=> Validator.validatePhone(value),
          expands: false,
          decoration: const InputDecoration(labelText: 'Phone Number',
              prefixIcon: Icon(Iconsax.call)),
        ),
        const SizedBox(
          height: 16,
        ),
        Obx(
        ()=> TextFormField(
            controller: controller.password,
            validator: (value)=> Validator.validatePassword(value),
            obscureText: controller.hidePassword.value,
            expands: false,
            decoration:  InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: IconButton(onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value, icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        TTermsAndConditionCheckbox(),
        const SizedBox(
          height: 18,
        ),
        SizedBox(
          width: double.infinity, child: ElevatedButton(
          onPressed: () => Get.to(()=> const VerifyEmailScreen(),),
          child: Text('Create Account'),
        ),
        ),
      ],
    ),);
  }
}
