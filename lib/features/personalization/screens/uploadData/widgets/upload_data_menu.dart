import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TUploadDataMenu extends StatelessWidget {
  const TUploadDataMenu(
      {super.key,
        required this.icon,
        required this.title,
        this.trailing, this.onTap});

  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,size: 28, color: TColors.primary,),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium,),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
