import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/styles/productVertical.dart';
import 'package:shop_ease/common/widgets/appBar.dart';
import 'package:shop_ease/common/widgets/gridLayout.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {

  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const CustomAppBar(
          title: Text('Popular Products'), showBack: false),

      body: SingleChildScrollView(

        child: Padding(

          padding: const EdgeInsets.all(Tsizes.defaultSpace),

          child: SortProducts(),

// Column

        ),

// Padding

      ),

// SingleChildScrollView

    );
  }
}

class SortProducts extends StatelessWidget {
  const SortProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [

        /// Dropdown

        DropdownButtonFormField(

          decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.sort)),

          onChanged: (value) {},

          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) =>
              DropdownMenuItem(value: option, child: Text(option)))
              .toList(),

// DropdownButtonFormField

        ),

        const SizedBox(height: Tsizes.spaceSection),

        /// Products

        GridLayout(itemCount: 8,
            itemBuilder: (_, index) => const ProductVertical())

      ],

    );
  }
}
