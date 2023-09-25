import 'package:flutter/material.dart';
import 'package:saudi_clean_services/core/managers/color_manager.dart';

class DetailsBtn extends StatelessWidget {
  const DetailsBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8,
          ),
          color: ColorManager.grey.withOpacity(
            0.2,
          ),
        ),
        child: Icon(
          Icons.arrow_forward_ios,
          size: 14,
          color: ColorManager.secondary,
        ),
      );
  }
}
