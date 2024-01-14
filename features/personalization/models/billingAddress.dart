import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_ease/features/authentication/screens/home.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {

  const TBillingAddressSection({super.key});

  @override

  Widget build(BuildContext context) {
    return Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Heading(title: 'Shipping Address',
              buttonTitle: 'Change',
              onPressed: () {}),

          Text('Pragati Agrahari', style: Theme
              .of(context)
              .textTheme
              .bodyLarge),

          Row(

              children: [

                const Icon(Icons.phone, color: Colors.grey, size: 16),

                const SizedBox(width: Tsizes.spaceItems),

                Text('+92-317-8059525', style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium),

              ]

          ), // Row

          const SizedBox(height: Tsizes.spaceItems / 2),

          Row(

            children: [

              const Icon(Icons.location_history, color: Colors.grey, size: 16),

              const SizedBox(width: Tsizes.spaceItems),

              Expanded(
                  child: Text('4th Floor, SM Appartment, Lucknow', style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium, softWrap: true)),

            ],

          ), // Row
        ]
    );
  }
  }