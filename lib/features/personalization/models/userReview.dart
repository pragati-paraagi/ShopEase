import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:readmore/readmore.dart';
import 'package:shop_ease/features/personalization/models/ratingIndicator.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants/sizes.dart';

class UserReview extends StatelessWidget {
  const UserReview({super.key, required this.date, required this.name, required this.rating});
  final String date, name;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Column (

        children: [

        Row (

        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

    Row (

    children: [

    const CircleAvatar (backgroundImage: AssetImage('assets/images/img_14.png')),

    const SizedBox(width: Tsizes.spaceItems),

    Text(name, style: Theme.of(context).textTheme.titleLarge),

    ],

    ), // Row

    IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),

    ],



    ),


    const SizedBox(height: Tsizes.spaceItems),

    /// Review

    Row (

    children: [

     TRatingBarIndicator(rating: rating),

    const SizedBox(width: Tsizes.spaceItems),

     Column(
       children: [
         Text('ShopEasy\'s Store  ', style: Theme.of(context).textTheme.titleMedium),
         Text(date, style: Theme.of(context).textTheme.bodyMedium),
       ],
     ),

    ],

    ), // Row

    const SizedBox(height: Tsizes.spaceItems),

    ReadMoreText(

    'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly.',

    trimLines: 2,

    trimMode: TrimMode.Line,

    trimExpandedText: 'Show less',

    trimCollapsedText: 'Show more',

    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Tcolors.primaryColor),
    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Tcolors.primaryColor),
    )
    ]
    );
  }
}
