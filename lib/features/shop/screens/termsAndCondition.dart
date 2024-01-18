import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/utils/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_s.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';
import 'package:shop_ease/utils/signup_controller.dart';

class TTermsAndConditionCheckbox extends StatelessWidget {

  const TTermsAndConditionCheckbox({

    super.key,

  });

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
                ()=> Checkbox(value: controller.privacyPolicy.value, onChanged: (value)=> controller.privacyPolicy.value =!controller.privacyPolicy.value
            ),
          ),
        ),
        const SizedBox(
          width: Tsizes.spaceItems,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${Ttexts.isAgree}', style: Theme
                  .of(context)
                  .textTheme
                  .bodySmall,
              ),

              TextSpan(
                text: Ttexts.privacyPolicy, style: Theme
                  .of(context)
                  .textTheme
                  .bodySmall!
                  .apply(
                color: dark ? Tcolors.White : Tcolors
                    .primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: dark ? Tcolors.White : Tcolors
                    .primaryColor,
              ),
              ),
              TextSpan(
                text: '${Ttexts.and}', style: Theme
                  .of(context)
                  .textTheme
                  .bodySmall,
              ),
              TextSpan(
                text: Ttexts.termsOfUse, style: Theme
                  .of(context)
                  .textTheme
                  .bodySmall!
                  .apply(
                color: dark ? Tcolors.White : Tcolors
                    .primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: dark ? Tcolors.White : Tcolors
                    .primaryColor,
              ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}