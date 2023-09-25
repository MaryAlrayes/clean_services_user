// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:saudi_clean_services/core/managers/color_manager.dart';

class DrawerItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback handler;
  const DrawerItem({
    Key? key,
    required this.iconData,
    required this.title,
    required this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData,color: ColorManager.primary,),
      title: Text(title),
      onTap: handler,
    );
  }
}
