
import 'package:flutter/material.dart';

class DekiveryNotificationItem extends StatelessWidget {
final String delegateName;
  final String text;
  const DekiveryNotificationItem({
    Key? key,
    required this.delegateName,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildContent();}

 Widget _buildContent() {
  return Text('$text $delegateName' );
 }
}
