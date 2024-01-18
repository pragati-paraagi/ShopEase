import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_ease/utils/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class TAnimationLoaderWidget extends StatelessWidget {

 /// Default constructor for the TAnimationLoaderWidget.

 ///


 const TAnimationLoaderWidget({

  super.key,

  required this.text,

  required this.animation,

  this.showAction = false,

  this.actionText,

  this.onActionPressed,

 });

 final String text;

 final String animation;

 final bool showAction;

 final String? actionText;

 final VoidCallback? onActionPressed;

 @override
 Widget build(BuildContext context) {
  return Center(

      child: Expanded(
        child: Column(
        
            mainAxisAlignment: MainAxisAlignment.center,
        
            children: [
        
            Lottie.asset(animation, width: MediaQuery
            .of(context)
            .size
            .width * 0.5), // Display Lottie animation
        
        const SizedBox(height: Tsizes.defaultSpace),
        
        Text(
        
         text,
        
         style: Theme
             .of(context)
             .textTheme
             .bodyMedium,
        
         textAlign: TextAlign.center,
        
        ), // Text
        
        const SizedBox(height: Tsizes.defaultSpace),
        
        showAction
        
            ? SizedBox(
        
         width: 200,
        
         child: OutlinedButton(
        
          onPressed: onActionPressed,
        
          style: OutlinedButton.styleFrom(backgroundColor: Tcolors.dark),
        
          child: Text(
        
           actionText!,
        
           style: Theme
               .of(context)
               .textTheme
               .bodyMedium!
               .apply(color: Tcolors.light),
        
          ),
         ),
        ) // Text ), // OutlinedButton // SizedBox
            : const SizedBox(),
        
          ]
          ,
          ),
      )
  ,

  );

 }
}// Column )