import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/colors.dart';
import '../../../utils/helpers/helper_f.dart';
class SettingMenu extends StatelessWidget {
  const SettingMenu({super.key, required this.icon, required this.title, required this.subtitle, this.trailing, this.onTap});
  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return ListTile(
      leading: Icon(icon, size: 20, color: Tcolors.primaryColor,),
      title: Text(title, style: Theme.of(context).textTheme.headlineSmall!.apply(color: dark ? Tcolors.White : Colors.black87 ),),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: dark ? Tcolors.White : Colors.black54),),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
