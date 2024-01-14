import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_ease/features/personalization/models/userReview.dart';
import 'package:shop_ease/utils/constants/device_util.dart';

import '../../../common/widgets/appBar.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../models/ratingIndicator.dart';

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(


        appBar: const CustomAppBar(title: Text('Reviews & Ratings'), showBack: true),

    body: SingleChildScrollView(

    child: Padding(

    padding: const EdgeInsets.all(Tsizes.defaultSpace),

    child: Column(

    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

    const Text("Ratings and reviews are verified and are from people who use the same type of device that you use."),

    const SizedBox(height: Tsizes.spaceItems),

    /// Overall Product Ratings

    Row(

    children: [

    Expanded(flex : 3, child: Text('4.81', style: Theme.of(context).textTheme.displayLarge)),

    Expanded(
      flex: 7,
      child: Column(
        children: [
          RatingIndicator(text: '5',value: 1.0,),
          RatingIndicator(text: '4',value: 0.8,),
          RatingIndicator(text: '3',value: 0.6,),
          RatingIndicator(text: '2',value: 0.4,),
          RatingIndicator(text: '1',value: 0.2,),
        ],
      ),

    )
      ]
      ),
      TRatingBarIndicator(rating : 3.5),
      Text('12,600', style: Theme.of(context).textTheme.bodySmall,),
      SizedBox(
        height: Tsizes.spaceSection,
      ),
      UserReview(name: 'Natasha Gill', date: '01 Nov, 2023',rating: 4,),
      SizedBox(
        height: 30,
      ),
      UserReview(name: 'Sudhir Singh', date: '28 Oct, 2023',rating: 5,),
      ]
    )
    )
    )
    );




  }
}

class RatingIndicator extends StatelessWidget {
  const RatingIndicator({super.key, required this.text, required this.value,});

  final String text;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(

    children: [

    Expanded(flex : 1, child: Text(text, style: Theme.of(context).textTheme.bodyMedium)),

    Expanded(
    flex: 11,
    child: SizedBox(
    width: TDeviceUtils.getScreenWidth(context) * 0.5,
    child: LinearProgressIndicator(

    value: value,

    minHeight: 13,

    backgroundColor: Tcolors.grey,

    borderRadius: BorderRadius.circular(7),

    valueColor: const AlwaysStoppedAnimation (Tcolors.primaryColor),

    ),
    ),
    )
    ]
    );
  }
}
