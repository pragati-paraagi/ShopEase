import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/utils/helpers/validation.dart';

import '../../features/shop/controllers/userControllers.dart';
import '../constants/sizes.dart';


class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: Validator.validateEmail,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: 'E-mail',
                  ),
                ), // TextFormField
                const SizedBox(height: Tsizes.spaceBwField),
                Obx(() => TextFormField(
                  obscureText: controller.hidePassword.value,
                  controller: controller.verifyPassword,
                  validator: (value) => Validator.validateEmptyText('Password', value),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                      icon: const Icon(Iconsax.eye_slash),
                    ), // IconButton
                  ), // InputDecoration
                ), // TextFormField
                ), // Obx
                const SizedBox(height: Tsizes.spaceSection),
                // LOGIN Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                    child: const Text("Verify"),
                  ),
                ), // SizedBox
              ], // children
            ), // Column
          ), // Form
        ), // Padding
      ), // SingleChildScrollView
    ); // Scaffold
  }
}
