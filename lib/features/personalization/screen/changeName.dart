import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/appBar.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/validation.dart';
import '../../authentication/controllers/updateName.dart';

class ChangeName extends StatelessWidget {

const ChangeName({super.key});

@override

Widget build(BuildContext context) {

final controller = Get.put(UpdateNameController());

return Scaffold(

/// Custom Appbar

appBar: CustomAppBar(

showBack: true,

title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall),

),
body: Padding(

padding:  EdgeInsets.all(Tsizes.defaultSpace),

child: Column (

crossAxisAlignment: CrossAxisAlignment.start,

children: [

/// Beadings

Text(

'Use real name for easy verification. This name will appear on several pages',

style: Theme.of(context).textTheme.labelMedium,

  ),

// Text

const SizedBox(height: Tsizes.spaceSection),

/// Test Field and button

Form(

key: controller.updateUserNameFormKey,

child: Column(

children: [

TextFormField(
  controller: controller.firstName,
  validator: (value) => Validator.validateEmptyText('First Name', value),
  expands: false,
  decoration: const InputDecoration(labelText: 'First Name', prefixIcon: Icon(Iconsax.user)),
  ),
  const SizedBox(
    height: Tsizes.spaceSection,
  ),
  TextFormField(
    controller: controller.firstName,
    validator: (value) => Validator.validateEmptyText('Last Name', value),
    expands: false,
    decoration: const InputDecoration(labelText: 'Last Name', prefixIcon: Icon(Iconsax.user)),
  ),

  ]
  ),
  ),
  const SizedBox(
    height: Tsizes.spaceSection,
  ),

  SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: ()=> controller.updateuserName(), child: Text('Save')))
  ],
  )
)
  );
}
}