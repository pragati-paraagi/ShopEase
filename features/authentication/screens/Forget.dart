import 'package:flutter/material.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_s.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:shop_ease/features/authentication/screens/Reset.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';
class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(padding: EdgeInsets.all(Tsizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage('assets/images/img_6.png',

          ),
            width: THelper.screenWidth() * 1,
            height: 300,
          ),
          Center(child: Text(Ttexts.forgotT, style: Theme.of(context).textTheme.headlineMedium,)),
          const SizedBox(
            height: Tsizes.spaceItems,
          ),
          Text(Ttexts.forgetsub, textAlign: TextAlign.center, style:TextStyle(
            fontFamily: 'Oregano',
            fontSize: 20,
            color: Color(0xff10564F),
          ),
          ),
          const SizedBox(
            height: Tsizes.spaceSection * 1,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'E-mail', prefixIcon: Icon(Iconsax.direct_right),
            ),
          ),
          const SizedBox(
            height: Tsizes.spaceSection,
          ),
          SizedBox(

            width: double.infinity,

            child: ElevatedButton(onPressed: () => Get.to(() => const ResetPassword()), child: const Text('Submit')),

          ),

        ],
      ),
      ),
    );
  }
}
