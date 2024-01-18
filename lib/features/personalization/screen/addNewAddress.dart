import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/appBar.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(showBack: true, title: Text('Add new Address')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Tsizes.defaultSpace),
              child: Form(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: 'Name',
                      ),
                    ),
                    const SizedBox(height: Tsizes.spaceBwField),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.mobile),
                        labelText: 'Phone Number',
                      ),
                    ),
                    const SizedBox(height: Tsizes.spaceBwField),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.building_31),
                              labelText: 'Postal Code',
                            ),
                          ),
                        ),
                        SizedBox(width: Tsizes.spaceBwField),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.code),
                              labelText: 'Street',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: Tsizes.spaceBwField),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.building),
                              labelText: 'City',
                            ),
                          ),
                        ),
                        const SizedBox(width: Tsizes.spaceBwField),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.activity),
                              labelText: 'State',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: Tsizes.spaceBwField),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.global),
                        labelText: 'Country',
                      ),
                    ),
                    const SizedBox(height: 60),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Save'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
