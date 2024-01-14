import 'package:flutter/material.dart';
import 'package:shop_ease/bindings/chipChoice.dart';
import 'package:shop_ease/features/shop/screens/productTitle.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';

import '../../../common/styles/productPrice.dart';
import '../../../common/widgets/RoundedContainer.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../authentication/screens/home.dart';

class Attributes extends StatelessWidget {
  const Attributes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return Column(
      children: [
        /// Selected Attribute Pricing & Description
        RoundedContainer(
          padding: const EdgeInsets.all(Tsizes.md),
          backgroundColor: dark ? Tcolors.darkerGrey : Tcolors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title, Price, and Stock Status
              Row(
                children: [
                  const Heading(title: 'Variation', showActionButton: false, textColor: Colors.black,),
                  const SizedBox(width: Tsizes.spaceItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                              title: 'Price : ', smallSize: true),

                          /// Actual Price
                          Text(
                            '2500',
                            style: TextStyle(
                                color: Colors.green,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.bold),
                          ), // Text
                          const SizedBox(width: Tsizes.spaceItems),

                          /// Sale Price
                          const ProdductPrice(
                            price: '2000',
                            color: Colors.black,
                          ),
                        ],
                      ), // Row
                      Row(
                        children: [
                          TProductTitleText(
                              title: 'Stock : ', smallSize: true),
                          Text(
                            'In Stock',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ), // Row
                    ],
                  ), // Column
                ],
              ), // Row

              /// Variation Description
              const SizedBox(height: Tsizes.spaceItems),

              const TProductTitleText(
                title:
                'Introducing our Sport Shoes - a perfect blend of style, comfort, and durability. Step into the world of fashion with these versatile and trendy shoes designed to elevate your every stride.',
                smallSize: true,
                maxLines: 4,
              ),
              // TProductTitleText
            ],
          ),
        ),
        SizedBox(
          height: 14,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Heading(title: 'Colors'),
            SizedBox(
              height: Tsizes.spaceItems / 2,
            ),
            Wrap(
              children: [
                TChoiceChip(text: 'Yellow', selected: true, onSelected: (value){},),
                TChoiceChip(text: 'Blue', selected: false, onSelected: (value){},),
                TChoiceChip(text: 'Green', selected: false,onSelected: (value){}),
                TChoiceChip(text: 'Red', selected: false,onSelected: (value){}),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Heading(title: 'Sizes'),
            SizedBox(
              height: Tsizes.spaceItems / 2,
            ),
            Wrap(
              children: [
                TChoiceChip(text: 'EU32', selected: true,onSelected: (value){}),
                SizedBox(width: 15,),
                TChoiceChip(text: 'EU34', selected: false,onSelected: (value){}),
                SizedBox(width: 15,),
                TChoiceChip(text: 'EU36', selected: false,onSelected: (value){}),
              ],
            ),

          ],
        ),
      ],
    );
  }
}
