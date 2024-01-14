import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/appBar.dart';
import 'package:shop_ease/features/authentication/screens/home.dart';
import 'package:shop_ease/features/personalization/screen/profileMenu.dart';

import '../../../utils/constants/sizes.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
    child: Padding (

    padding: const EdgeInsets.all(Tsizes.defaultSpace),

    child: Column(

    children: [

    /// Profile Picture

    SizedBox(

    width: double.infinity,

    child: Column (

    children: [

    const RoundImage(imageUrl:'assets/icons/img_5.png', width: 80, height: 80),

    TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),

    ], // Column

    ),
    ),// SizedBox

    /// Details

    const SizedBox(height: Tsizes.spaceItems / 2),

    const Divider(),

    const SizedBox(height: Tsizes.spaceItems),

      const Heading(title: 'Profile Information'),
    const SizedBox(height: Tsizes.spaceItems),

    ProfileMenu(title: 'Name', value: 'Pragati Agrahari', onPressed: () {}),

    ProfileMenu(title: 'Username', value: 'pragati_paraagi', onPressed: () {}),

    const SizedBox(height: Tsizes.spaceItems),

    const Divider(),

    const SizedBox (height: Tsizes.spaceItems),

    /// Heading Personal Info

    const Heading(title: 'Personal Information', showActionButton: false),

    const SizedBox(height: Tsizes.spaceItems),

    ProfileMenu(title: 'User ID', value: '45689', icon: Iconsax.copy, onPressed: () {}),

    ProfileMenu(title: 'E-mail', value: 'pragati@gmail.com', onPressed: () {}),

    ProfileMenu(title: 'Phone Number', value: '+91-456373892', onPressed: () {}),

    ProfileMenu(title: "Gender", value: 'Female', onPressed: (){}),

    ProfileMenu(title: 'Date of Birth', value: '09 April, 2005', onPressed: () {}),

    const Divider(),

    const SizedBox (height: Tsizes.spaceItems),

    Center (

    child: TextButton(

    onPressed: (){},

    child: const Text('Close Account', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w900)),

    ), // TextButton

    ),
      ]

      ),
    ),
    ),
    );
  }
}
