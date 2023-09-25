// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';
import 'package:saudi_clean_services/core/managers/color_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class PreviousBtn extends StatelessWidget {
    final VoidCallback handler;
  const PreviousBtn({
    Key? key,
    required this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.grey,
      ),
      onPressed: handler,
      child: Text(AppLocalizations.of(context)!.back),
    );
  }
}
