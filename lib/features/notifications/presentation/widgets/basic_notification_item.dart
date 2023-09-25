

import 'package:flutter/material.dart';

class BasicNotificationItem extends StatelessWidget {

  final String text;
  const BasicNotificationItem({
    Key? key,

    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildContent();}

 Widget _buildContent() {
  return Text(text);
 }
}
