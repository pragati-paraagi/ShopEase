import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/utils/constants/device_util.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title, this.actions, this.leadingIcon, this.leadingPressed, this.showBack=true,});

  final Widget? title;
  final bool showBack;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Tsizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBack? IconButton(onPressed: ()=>Get.back, icon:const Icon(Iconsax.arrow_left)) : leadingIcon!=null ? IconButton(onPressed:leadingPressed, icon: Icon(leadingIcon)) : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
