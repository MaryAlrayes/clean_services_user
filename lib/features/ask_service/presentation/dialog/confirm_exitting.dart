import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:saudi_clean_services/core/managers/color_manager.dart';

showExitDialog(
  BuildContext context,
) {
  return AlertDialog(
    title: Text(
      AppLocalizations.of(context)!.confirm_exitting_title_dialog,
      textAlign: TextAlign.center,
    ),
    content: Text(
        AppLocalizations.of(context)!.confirm_exitting_subtitle_dialog,
        textAlign: TextAlign.center),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context, true);
        },
        child: Text(
          AppLocalizations.of(context)!.confirm_exitting_yes_btn_dialog,
          textAlign: TextAlign.center,
        ),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context, false);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.grey,
        ),
        child: Text(
          AppLocalizations.of(context)!.confirm_exitting_cancel_btn_dialog,
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
