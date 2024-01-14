import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/appBar.dart';
import 'package:shop_ease/features/authentication/screens/home.dart';
import 'package:shop_ease/features/personalization/screen/OrderScreen.dart';
import 'package:shop_ease/features/personalization/screen/addresses.dart';
import 'package:shop_ease/features/personalization/screen/profile.dart';
import 'package:shop_ease/features/personalization/screen/settings_menu.dart';
import 'package:shop_ease/utils/colors.dart';
import 'package:iconsax/iconsax.dart';
import '../../../common/widgets/container.dart';
import '../../../utils/constants/sizes.dart';
class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
        ClipCurve(
        child: Container(
      color: Tcolors.primaryColor,
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: 260,
        child: Stack(
          children: [

            Positioned(
                top: -150,
                right: -250,
                child: Circular(backgroundColor: Tcolors.textWhite.withOpacity(0.1),)),
            Positioned(
                top: 100,
                right: -300,
                child: Circular(backgroundColor: Tcolors.textWhite.withOpacity(0.1),)
            ),
            Column(
              children: [
                CustomAppBar(
                  title: Text('Account',
                    style: Theme.of(context).textTheme.headlineMedium!.apply(color: Tcolors.White),
                  ),

                ),
                const SizedBox(
                  height: Tsizes.spaceSection,
                ),
                ListTile(
                  leading: RoundImage(
                    imageUrl: 'assets/icons/img_5.png',
                    width: 50,
                    height: 50,
                  ),
                  title: Text('Pragati Agrahari', style: Theme.of(context).textTheme.headlineSmall!.apply(color: Tcolors.White),),
                  subtitle: Text('pragatiagrahari40@gmail.com', style: Theme.of(context).textTheme.headlineSmall!.apply(color: Tcolors.White),),
                  trailing: IconButton(onPressed: ()=>Get.to(Profile()), icon: Icon(Iconsax.edit, color:Tcolors.White),),

                ),
                const SizedBox(
                  height: Tsizes.spaceSection,
                ),
              ],
            ),


      ]
        ),

      ),
        ),

          
        ),
            Padding(padding: EdgeInsets.all(Tsizes.defaultSpace),
              child: Column(
                children: [
                  Heading(title: 'Account Settings', showActionButton: false,),
                  SizedBox(height: Tsizes.spaceItems,),

                  SettingMenu(
                    icon : Iconsax.safe_home, title: 'My Addresses',
                    subtitle: 'Set shopping delivery address',
                    onTap:()=>Get.to(()=>Addresses()),
                  ),
                  SettingMenu(
                    icon : Iconsax.shopping_cart, title: 'My Cart',
                    subtitle: 'Add, remove products and move to checkout.',
                    onTap:(){},
                  ),
                  SettingMenu(
                    icon : Iconsax.bag_tick, title: 'My Orders',
                    subtitle: 'In-progress and Completed Orders',
                    onTap:()=> Get.to(()=> OrderScreen()),
                  ),
                  SettingMenu(
                    icon : Iconsax.bank, title: 'Bank Acccount',
                    subtitle: 'Withdraw balance to registered bank account',
                    onTap:(){},
                  ),
                  SettingMenu(
                    icon : Iconsax.discount_shape, title: 'My Coupons',
                    subtitle: 'List of all the discounted coupons',
                    onTap:(){},
                  ),
                  SettingMenu(
                    icon : Iconsax.notification, title: 'Notifications',
                    subtitle: 'Set any kind of notification message',
                    onTap:(){},
                  ),
                  SettingMenu(
                    icon : Iconsax.security_card, title: 'Account Privacy',
                    subtitle: 'Manage data usage and connected accounts',
                    onTap:(){},
                  ),
                  SizedBox(height: Tsizes.spaceSection,),
                  Heading(title: 'App Settings', showActionButton: false,),
                  SizedBox(height: Tsizes.spaceItems,),

                  SettingMenu(
                    icon : Iconsax.location, title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value){},),

                  ),
                  SettingMenu(
                    icon : Iconsax.security_user, title: 'Safe Mode',
                    subtitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value){},),

                  ),
                  SettingMenu(
                    icon : Iconsax.security_card, title: 'HD Image Quality',
                    subtitle: 'Set Image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value){},),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: (){},
                      child: Text('Logout'),
                    ),
                  ),
                  SizedBox(height: Tsizes.spaceSection * 2.5,),
                ],
              ),
            )
      ]

      ),
      ),
    );
  }
}
