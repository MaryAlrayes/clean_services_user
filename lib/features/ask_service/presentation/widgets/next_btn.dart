// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NextBtn extends StatelessWidget {
  final String text;
  final VoidCallback handler;
  const NextBtn({
    Key? key,
    required this.handler,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: handler,
      child: Text(
        text,
      ),
    );
  }
}
