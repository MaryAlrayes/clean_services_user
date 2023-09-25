
import 'package:flutter/material.dart';
import 'package:saudi_clean_services/core/managers/color_manager.dart';
import 'package:saudi_clean_services/core/managers/styles_manager.dart';

class ConfirmTerms extends StatefulWidget {
  const ConfirmTerms({super.key});

  @override
  State<ConfirmTerms> createState() => _ConfirmTermsState();
}

class _ConfirmTermsState extends State<ConfirmTerms> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = !isChecked;
              });
            }),
        Text('أوفق على '),
        Text(
          'الشروط والأحكام',
          style: getBoldStyle(color: ColorManager.primary).copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      ]),
    );
  }
}
